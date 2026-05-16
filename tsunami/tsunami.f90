program tsunami

! This program simulates the advection of a water wave.

implicit none ! disable implicit typing

! variables declaration (a parameter is a constant)
integer :: i, n                            ! index for space and time
integer, parameter :: grid_size = 100      ! size of the spatial 1-D grid
integer, parameter :: num_time_steps = 100 ! number of time steps

real, parameter :: dt = 1.0 ! time step [s]
real, parameter :: dx = 1.0 ! grid spacing [m]
real, parameter :: c = 1.0  ! phase speed [m/s]

real :: h(grid_size)  ! array to store the height of the wave at each spatial cell and time step 
real :: dh(grid_size) ! array to store the  finite difference

integer, parameter :: icenter = 25
real, parameter :: decay = 0.02

! Initialize the wave array
do concurrent (i = 1:grid_size)
  h(i) = exp(-decay * (i - icenter)**2)
end do

! Loop for a number of time steps 
time_loop: do n = 1, num_time_steps
  dh(1) = h(1) - h(grid_size)
  do concurrent (i = 2:grid_size)
    dh(i) = h(i) - h(i-1)  ! calculate the height delta
  end do
  
  do concurrent (i =1:grid_size)
    h(i) = h(i) - c * dh(i) / dx * dt  ! update the height
  end do

  write(*,*) n, h

end do time_loop

end program tsunami
