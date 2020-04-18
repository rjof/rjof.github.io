
<!-- README.md is generated from README.Rmd. Please edit that file -->

### The Coronavirus Dashboard

This [Coronavirus
dashboard](https://ramikrispin.github.io/coronavirus_dashboard/)
provides an overview of the 2019 Novel Coronavirus COVID-19 (2019-nCoV)
epidemic. This dashboard is built with R using the Rmakrdown framework
and can easily reproduce by others.

The data behind this dashboard can be found in the following
[repository](https://github.com/RamiKrispin/coronavirus), and its update
on a daily
bases

<img src="figures/dash1.png" width="100%" />

<img src="figures/dash2.png" width="100%" />

## Local installation notes

``` r
Thu Apr 16 11:45:02 1 [olvera !?] ~/Projects/github/coronavirus_dashboard/ brew install llvm
```

``` r
m <- system("brew info llvm", intern=TRUE)
m
#>  [1] "llvm: stable 10.0.0 (bottled), HEAD [keg-only]"                                
#>  [2] "Next-gen compiler infrastructure"                                              
#>  [3] "https://llvm.org/"                                                             
#>  [4] "/usr/local/Cellar/llvm/10.0.0_1 (7,019 files, 1GB)"                            
#>  [5] "  Poured from bottle on 2020-04-16 at 12:17:08"                                
#>  [6] "From: https://github.com/Homebrew/homebrew-core/blob/master/Formula/llvm.rb"   
#>  [7] "==> Dependencies"                                                              
#>  [8] "Build: cmake, python@3.8"                                                      
#>  [9] "Required: libffi"                                                              
#> [10] "==> Requirements"                                                              
#> [11] "Build: xcode"                                                                  
#> [12] "==> Options"                                                                   
#> [13] "--HEAD"                                                                        
#> [14] "\tInstall HEAD version"                                                        
#> [15] "==> Caveats"                                                                   
#> [16] "To use the bundled libc++ please add the following LDFLAGS:"                   
#> [17] "  LDFLAGS=\"-L/usr/local/opt/llvm/lib -Wl,-rpath,/usr/local/opt/llvm/lib\""    
#> [18] ""                                                                              
#> [19] "llvm is keg-only, which means it was not symlinked into /usr/local,"           
#> [20] "because macOS already provides this software and installing another version in"
#> [21] "parallel can cause all kinds of trouble."                                      
#> [22] ""                                                                              
#> [23] "If you need to have llvm first in your PATH run:"                              
#> [24] "  echo 'export PATH=\"/usr/local/opt/llvm/bin:$PATH\"' >> ~/.bash_profile"     
#> [25] ""                                                                              
#> [26] "For compilers to find llvm you may need to set:"                               
#> [27] "  export LDFLAGS=\"-L/usr/local/opt/llvm/lib\""                                
#> [28] "  export CPPFLAGS=\"-I/usr/local/opt/llvm/include\""                           
#> [29] ""                                                                              
#> [30] "==> Analytics"                                                                 
#> [31] "install: 25,891 (30 days), 60,997 (90 days), 203,527 (365 days)"               
#> [32] "install-on-request: 20,033 (30 days), 47,170 (90 days), 156,858 (365 days)"    
#> [33] "build-error: 0 (30 days)"
```
