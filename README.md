# Graph Coloring for Efficient Code Compilation

#### Large-scale LLVM-based interference graph generation for graph coloring

Haven Cook, Andrew Erickson, Ethan Rapa

![](Reports%20and%20Slides/Final%20Report/figures/Workflow.png)


## <u>Important Content</u>
#### << *[Read the Full Paper](Reports_and_Slides/Final_Report/DLOG_final_report.pdf)*
#### << *[Graph Generator](IG_Gen/generate_IR.cpp)*
#### << *[Sample Large Dataset](IG_Gen/DATASETv2)*

## <u>Build Instructions</u>

#### <u>Dependencies</u>

```
sudo apt install clang llvm opt
```

The provided Makefile is self-contained, and will compile the executable, then compile every file within a specified source directory, currently DATASETv2, to LLVM IR code. Following this, the executable will automatically be run in parallel upon every generated IR file, yielding output graph files in output_graph.

**Run in parallel (N jobs):** 

```
cd IG_Gen/
make all -jN -k
```

**Clear the output and IR files:** 

```make clean_full```

### <u>TODO</u>

* Address bitReg segfault
* Move methods to their own implementation files