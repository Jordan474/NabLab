/*******************************************************************************
 * Copyright (c) 2021 CEA
 * This program and the accompanying materials are made available under the 
 * terms of the Eclipse Public License 2.0 which is available at
 * http://www.eclipse.org/legal/epl-2.0.
 *
 * SPDX-License-Identifier: EPL-2.0
 * Contributors: see AUTHORS file
 *******************************************************************************/
package fr.cea.nabla.ir.interpreter

import fr.cea.nabla.ir.ir.BaseType
import fr.cea.nabla.ir.ir.ConnectivityType
import fr.cea.nabla.ir.ir.IrType
import fr.cea.nabla.ir.ir.LinearAlgebraType

import static fr.cea.nabla.ir.interpreter.ExpressionInterpreter.*

class IrTypeExtensions
{
	static def int[] getIntSizes(IrType it, Context context)
	{
		switch it
		{
			BaseType: interpreteDimensionExpressions(it.sizes, context)
			ConnectivityType: it.connectivities.map[x | context.mesh.getSize(x)] + getIntSizes(it.base, context)
			LinearAlgebraType: interpreteDimensionExpressions(it.sizes, context)
		}
	}
}