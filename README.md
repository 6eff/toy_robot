# Toy Robot Simulator

### Description:
The application is a simulation of a toy robot moving on a square tabletop. There are no other obstructions on the table surface. The robot is free to roam around the surface of the table, but must be prevented from falling to destruction. Any movement that would result in the robot falling from the table must be prevented, however further valid movement commands still allowed.

**To run the app you'll need Ruby installed on your machine.**
* clone repo https://github.com/6eff/toy_robot
* cd into root directory
* run *bundle* (gem install bundle, if no bundle installed)
* run *ruby lib/game.rb*
* enjoy
* to check tests passing run *rspec* in your terminal

### Commands

- PLACE will put the toy robot on the table in position `X`,`Y` and facing `NORTH`, `SOUTH`, `EAST` or
`WEST`.
- `MOVE` will move the toy robot one unit forward in the direction it is currently facing.
- `LEFT` and `RIGHT` will rotate the robot 90 degrees in the specified direction without changing
the position of the robot.
- `REPORT` will announce the `x`,`y` and `facing` of the robot.

## Thank you for comments and bug reporting
