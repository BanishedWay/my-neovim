" 设置编译和运行快捷键
func! CompileGcc()
    let compilecmd="!gcc "
    let compileflag="-o %< "
    if search("mpi\.h") != 0
        let compilecmd = "!mpicc "
    endif
    if search("glut\.h") != 0
        let compileflag .= " -lglut -lGLU -lGL "
    endif
    if search("cv\.h") != 0
        let compileflag .= " -lcv -lhighgui -lcvaux "
    endif
    if search("omp\.h") != 0
        let compileflag .= " -fopenmp "
    endif
    if search("math\.h") != 0
        let compileflag .= " -lm "
    endif
    exec compilecmd." % ".compileflag
endfunc
func! CompileGpp()
    let compilecmd="!g++ "
    let compileflag="-o %< "
    if search("mpi\.h") != 0
        let compilecmd = "!mpic++ "
    endif
    if search("glut\.h") != 0
        let compileflag .= " -lglut -lGLU -lGL "
    endif
    if search("cv\.h") != 0
        let compileflag .= " -lcv -lhighgui -lcvaux "
    endif
    if search("omp\.h") != 0
        let compileflag .= " -fopenmp "
    endif
    if search("math\.h") != 0
        let compileflag .= " -lm "
    endif
    exec compilecmd." % ".compileflag
endfunc

func! RunPython()
    exec "!python %"
endfunc

func! RunLua()
    exec "!lua %"
endfunc

func! CompileJava()
    exec "!javac %"
endfunc

func! CompileCode()
    if &filetype == "cpp"
        exec "call CompileGpp()"
    elseif &filetype == "c"
        exec "call CompileGcc()"
    elseif &filetype == "python"
        exec "call RunPython()"
    elseif &filetype == "java"
        exec "call CompileJava()"
    elseif &filetype=="lua"
        exec "call RunLua()"
    endif
endfunc

func! RunResult()
    if search("mpi\.h") != 0
        exec "call CompileCode()"
        exec "!mpirun -np 4 ./%<"
    elseif &filetype == "cpp"
        exec "call CompileCode()"
        exec "! ./%<"
    elseif &filetype == "c"
        exec "call CompileCode()"
        exec "! ./%<"
    elseif &filetype == "python"
        exec "call RunPython()"
    elseif &filetype == "java"
        exec "call CompileCode()"
        exec "!java %<"
    elseif &filetype == "txt"
        exec "! ./%<"
    elseif &filetype=="lua"
        exec "call RunLua()"
    elseif &filetype == "html"
        exec "!microsoft-edge-stable %"
    endif
endfunc

func! FormatSave()
    if &filetype=="c"
        exec "Neoformat clangformat"
    elseif &filetype=="h"
        exec "Neoformat clangformat"
    elseif &filetype=='cpp'
        exec "Neoformat clangformat"
    endif
    exec "Neoformat"
    exec "w"
endfunc

func! TSHighlight()
    exec "TSEnable highlight"
    exec "TSEnable indent"
    exec "TSEnable rainbow"
    exec "TSEnable incremental_selection"
endfunc

" LSPInstall
func! LSPInstall()
    let lspcmd="LspInstall "
    let servers=["pyright","clangd","cmake","jdtls","sumneko_lua","vimls","zk"]
    for server in servers
        let execcmd=lspcmd
        let execcmd.=server
        exec execcmd
    endfor
endfunc

