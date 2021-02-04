function printgrid(num_rows::Int=2, num_columns::Int=2)
    printRowStart(num_columns)
    if num_rows == 2
        do_2times(printRowEnd, num_columns)
    elseif num_rows == 4
        do_4times(printRowEnd, num_columns)
    end
end

function printRowStart(num_columns::Int=2)
    printRowBorder(num_columns)
end

function printRowEnd(num_columns::Int=2)
    do_4times(printRowBody, num_columns)
    printRowBorder(num_columns)
end

function printRowBorder(num_columns::Int=2)
    printCellBorderStart()
    if num_columns == 2
        do_2times(printCellBorderEnd)
    elseif num_columns == 4
        do_4times(printCellBorderEnd)
    end
    println()
end

function printRowBody(num_columns::Int=2)
    printCellBodyStart()
    if num_columns == 2
        do_2times(printCellBodyEnd)
    elseif num_columns == 4
        do_4times(printCellBodyEnd)
    end
    println()
end

function printCellBorderStart()
    print("+")
end

function printCellBorderEnd()
    print(" - - - - +")
end

function printCellBodyStart()
    print("|")
end

function printCellBodyEnd()
    print("         |")
end

function do_2times(f)
    f()
    f()
end

function do_2times(f, a)
    f(a)
    f(a)
end

function do_4times(f)
    do_2times(f)
    do_2times(f)
end

function do_4times(f, a)
    do_2times(f, a)
    do_2times(f, a)
end

printgrid()
printgrid(4, 4)
