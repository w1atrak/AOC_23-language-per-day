program aoc_9_1
    implicit none

    character(len=500) :: line
    logical :: notAllZeros = .true.
    integer :: ios, pos, num, sum = 0, count, i, j, k, A, ii
    integer, allocatable :: array(:)
    integer :: count_substring

    open(unit=10, file='input.txt', status='old', action='read')
    do
        read(10, '(A)', iostat=ios) line
        if (ios < 0) then
            exit

        else
            i = 1
            count = count_substring(line, ' ')
            allocate(array(count))

            do while (len_trim(line) > 0)
                pos = index(line, ' ')
                read(line(1:pos-1), *) num
                line = line(pos+1:)
                array(i) = num
                i = i + 1
            end do
            k = i - 2
            
            outer: do while (notAllZeros)
                notAllZeros = .false.
                inner: do j = 1, k
                    array(j) = array(j+1) - array(j)
                    if (array(j) /= 0) then
                        notAllZeros = .true.
                    end if
                end do inner
                k = k - 1
            end do outer
            notAllZeros = .true.

            A = 0
            do ii = k+1, count - 1
                A = array(ii+1) + A
            end do
            
            sum = sum + A

            deallocate(array)
        end if
    end do

    close(10)

    print *, sum
end program aoc_9_1


integer function count_substring(str, sub)
    implicit none
    character(len=*), intent(in) :: str, sub
    character(len=500) :: local_str
    integer :: pos,  count

    local_str = str
    count = 0
    
    do while (len_trim(local_str) > 0)
        pos = index(local_str, sub)
        local_str = local_str(pos+1:)
        count = count + 1
    end do

    count_substring = count
end function count_substring
