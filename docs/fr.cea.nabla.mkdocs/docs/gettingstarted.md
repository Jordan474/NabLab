# Getting started

## Download and install

### Prerequisite

NabLab requires [Java 11](https://openjdk.java.net/projects/jdk/11/) or later to build & run. 

Do not forget to set the `JAVA_HOME` variable to the java installation directory and to update your path.


### Installing NabLab

The latest NabLab environment can be downloaded [here](https://github.com/cea-hpc/NabLab/releases/tag/v0.4.1) for Linux, Mac OS and Windows platforms.

Download the file corresponding to your platform, unzip it and launch the NabLab executable in the root directory.

For Mac users, depending on your security configuration, you have to enter the following command to execute NabLab: `xattr -d com.apple.quarantine NabLab.app`.


### Installing NabLab debugger

NabLab debugger is part of the [Debug4Science project](http://gemoc.org/debug4science/).

<center>
<img src="http://gemoc.org/debug4science/img/cea.png" alt="CEA" style="width: 100px;"/>
&nbsp;&nbsp;&nbsp;
<img src="http://gemoc.org/debug4science/img/inria.png" alt="Inria" style="width: 150px;"/>
</center>

It is based on [GraalVM](https://www.graalvm.org/) and [Monilog](https://github.com/gemoc/monilog). The aim of this project is to provide debugging facilities for both interpreted and compiled code. For the moment, only the interpreted part is available. The compiled one is still under development.

To install the debugger, download monilog4nablab-0.4.0.zip [here](https://github.com/cea-hpc/Monilog4NabLab/releases/tag/v0.4.0/) and follow the Monilog4NabLab [installation instructions](https://github.com/cea-hpc/Monilog4NabLab#how-to-install). As explained in those instructions, GraalVM will be installed in the folder of your IDE.

Thanks to Monilog, you can create your own debugging scripts. To write them in Python, install Graalpython in following the instructions available [here](https://www.graalvm.org/reference-manual/python/). You can also install numpy which is a supported package of GraalVM: just replace `pandas` by `numpy` in the [package installation instructions](https://www.graalvm.org/reference-manual/python/#installing-supported-packages). 


### Build via Maven 3.x

If you need to build NabLab products (Windows/Linux/MacOS and Eclipse update-site) from the source code (instead of downloading it), run the following command from the root of the repository:

`mvn clean -P build,updatesite; mvn verify -P build,updatesite`.

Note the `';'` after `mvn clean -P build,updatesite`. 

The products resulting from the build will be accessible in */releng/fr.cea.nabla.updatesite/target/products/NabLab-X.Y.Z.yyyymmddHHMM-YOUR_PLATFORM.zip*.

The Eclipse update-site resulting from the build will be accessible in */releng/fr.cea.nabla.updatesite/target/fr.cea.nabla.updatesite-X.Y.Z.yyyymmddHHMM.zip*.

If you only need to compile NabLab code and execute tests, run the following command from the root of the repository:
`mvn clean; mvn verify`

If you want to skip tests execution, you can run the following command:
`mvn clean; mvn verify -Dmaven.test.skip=true`


## First step in the environment

### Overview

The NabLab environment is based on the [Eclipse Modeling Framework](https://www.eclipse.org/modeling/emf/) (EMF). The central part of the NabLab environment displays a textual editor, based on [Xtext](https://www.eclipse.org/Xtext/) which provides contextual code completion, code folding, syntax highlighting, error detection, quick fixes, variable scoping, and type checking. The left part of the environment proposes a model explorer and a dedicated interactive outline view to navigate easily through the textual editor. The bottom part is composed of several views including a rich LaTeX visualization of the selection in the editor. A graphical editor based on [Sirius](https://www.eclipse.org/sirius/) allows to visualize the data flow graph between jobs.

<img src="img/NabLab_main_window.png" alt="NabLab Main Window" title="NabLab Main Window" width="100%" height="100%" />

### Perspective

Once the NabLab environment has been launched, the NabLab perspective should be selected. If it is not the case, just select the NabLab perspective from the *Window > Perspective > Open Perspective > Other ... > NabLab* menu.

<img src="img/NabLab_perspective_menu.png" alt="NabLab Perspective Menu" title="NabLab Perspective Menu" width="40%" height="40%" />

The NabLab perspective provides a set of *Views* and wizards shortcuts allowing to easily create and develop NabLab projects.


### Examples project

Just click on the main menu From the *File > New > NabLab Examples* to import the examples project:

<img src="img/NabLab_new_examples_menu.png" alt="NabLab Examples" title="NabLab Examples" width="60%" height="60%" />

A new wizard is launched:

<img src="img/NabLab_examples_wizard.png" alt="NabLab Examples Wizard" title="NabLab Examples Wizard" width="80%" height="80%" />

Just click on the *Finish* button to import the examples project that becomes available in the *Model Explorer* view on the left of the perspective. It contains a set of examples including Glace2D, HeatEquation, ExplicitHeatEquation, IterativeHeatEquation and ImplicitHeatEquation.

<img src="img/NabLab_examples_generated_files.png" alt="NabLab Examples Generated Files" title="NabLab Examples Generated Files" width="100%" height="100%" />


### Code generation

To launch code generation corresponding to the NabLab module, just right-click on the ngen file of the project of your choice, for example *NabLabExamples/src/explicitheatequation/ExplicitHeatEquation.ngen* and select *Generate Code*

<img src="img/NabLab_generate_code.png" alt="NabLab Generate Code" title="NabLab Generate Code" width="50%" height="50%" />

Java and C++ source code files are generated in *src-gen-java* and *src-gen-cpp* folders respectively. For each C++ folder a *CMakeLists.txt* file is generated.
A LaTeX file containing the content of the jobs and an example of json data file are also generated in the *src-gen* folder.  

<img src="img/NabLab_generated_files.png" alt="NabLab Generated Files" title="NabLab Generated Files" width="30%" height="30%" />

!!! note
	A good practice is to name *src-gen* a directory containing only generated code.


### Interpretation

To launch code interpretation corresponding to the NabLab module, just right-click on the *ngen* file of the project of your choice, for example *NabLabExamples/src/explicitheatequation/ExplicitHeatEquation.ngen* and select *Run As > Start Interpretation*.

<img src="img/NabLab_start_interpretation.png" alt="NabLab Start Interpretation" title="NabLab Start Interpretation" width="50%" height="50%" />

To change the *json* file of your interpretation, right-click on the *ngen* file and select *Run As > Run Configurations*, select your configuration, for example *ExplicitHeatEquation.ngen*, and change the *json* file in the dialog window.

<img src="img/NabLab_interpretation_configuration.png" alt="NabLab Interpretation Configuration" title="NabLab Interpretation Configuration" width="80%" height="80%" />

!!! note
	If you have installed and configured GraalVM for NabLab, you can interpret your module using GraalVM: just select *Run As > Start Truffle-Based Interpretation* instead of *Run As > Start Interpretation*. You can set configuration like previously and set the monilog file and python executable path.


### LaTeX view

The *LaTeX View* is located on the bottom of the NabLab environment. It allows to visualize in an elegant way the formulas contained in a .n file.

If you do not use the NabLab perspective the *The LaTeX View* is not visible. You can access it through the *Window > Show View > Other... > NabLab > LaTeX View* main menu.

This view is automatically updated and synchronized with the selection in the current NabLab editor.

<img src="img/NabLab_latex_view.png" alt="NabLab Latex View" title="NabLab Latex View" width="100%" height="100%" />


### Job graph

NabLab offers 2 visualization modes for job graph: a fast rendering view and an editor with a more efficient layout.
In case of job cycles, both of the modes will display the cycle graphically to highlight the error.  

!!! note
	In both visualization modes, let the mouse over a job node to display its input and output variables.

#### View

The *Job Graph View* can be opened from a *ngen* file containing an *Application*, by clicking on F1.

It allows to quickly visualize the data flow graph of the application described in the ngen file.

<img src="img/NabLab_job_graph_view.png" alt="NabLab Job Graph View" title="NabLab Job Graph View" width="100%" height="100%" />


#### Editor

NabLab offers another way of visualizing the data flow graph of an application.

The *Job Graph Editor* can be opened from a *ngen* file containing an *Application*, by clicking on F2.

It allows to visualize bigger graphs than the *Job Graph View* thanks to an efficient layout.

<img src="img/NabLab_job_graph_editor.png" alt="NabLab Job Graph Editor" title="NabLab Job Graph Editor" width="100%" height="100%"/>

