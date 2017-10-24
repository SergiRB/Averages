! *********************************************************************
!   Average all the data from the output of LAMMPS for the
!   case of the rod-like trimer
! *********************************************************************

!                                        Sergi Roca-Bonet, Juelich 2017

program average
  
  integer, parameter :: n = 60000
  integer, parameter :: nfiles = 4
  real*4, dimension(n,8) :: data
  real*4, dimension(8) :: a
  integer :: i, j, k
  character(5000) :: filename

!  open(111, file='binned.sym.trimer.rod.rep1.dat', status='old')
!  open(222, file='binned.sym.trimer.rod.rep2.dat', status='old')
!  open(333, file='binned.sym.trimer.rod.rep3.dat', status='old')
!  open(444, file='binned.sym.trimer.rod.rep4.dat', status='old')
!  open(555, file='binned.sym.trimer.rod.rep5.dat', status='old')

  do k = 1, nfiles
    !filename = "binned.sym.trimer.rod.rep"//char(k)//".dat"
    write(filename,fmt='(A25,I1,A4)') "binned.sym.trimer.rod.rep", k, ".dat"
    open(k*111,file=filename)
    do i = 1, n
      read(k*111,*) a(1), a(2), a(3), a(4), a(5), a(6), a(7), a(8)
      do j =1, 8
        data(i,j) = data(i,j) + a(j)
      enddo
    enddo
  enddo

  data = data / float(nfiles)

  open(999, file='averaged.sym.trimer.dat')

  do k = 1, n
    write(999,*) k,data(k,2),data(k,3),data(k,4),data(k,5),data(k,6),data(k,7),data(k,8)
  enddo

  close(111)
  close(222)
  close(333)
  close(444)
  close(999)

end program average
