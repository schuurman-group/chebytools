module constants
  integer, parameter    :: dp=selected_real_kind(8)
  integer, parameter    :: lng=selected_int_kind(16)
  

  real(dp), parameter    :: rzero=0._dp
  real(dp), parameter    :: rone=1._dp
  real(dp), parameter    :: pi=3.1415926535897932_dp
  complex(dp), parameter :: ci=(0._dp,1._dp)
  complex(dp), parameter :: czero=(0._dp,0._dp)
  complex(dp), parameter :: cone=(1._dp,0._dp)
  
  integer, dimension(64), parameter :: mtrow=(/ 1,2,3,4,5,6,7,8,2,1,4,3,6,5,8,7,3,4,1,2,7,8,5,6,4,&
       3,2,1,8,7,6,5,5,6,7,8,1,2,3,4,6,5,8,7,2,1,4,3,7,8,5,6,3,4,1,2,8,7,6,5,4,3,2,1 /)
end module constants
