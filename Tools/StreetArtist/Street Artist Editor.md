See [Street Artist Generation](https://github.com/official-antistasi-community/A3-Antistasi/wiki/Street-Artist-Generation) for starting up the editor.<br/>

*Help for the Editor's functions is provided in-game.*<br/>
*However, there are guidelines for creating A3-Antistasi navGrids.*<br/>

# Important Guidelines
### 1. Along a road section, the closest node must be one at the end.
The Street Artist Generation takes this into account when simplifying the navGrid.<br/>
However, there is no checking when the user connects nodes or adds new ones.<br/>
Ensure that new nodes will not become the closest to any other nearby roads.<br/>
### 2. Ground supplied outposts should have a node within 300m.
You can create a path to outposts and airports to allow ground convoys access.<br/>
You will need to take a screenshot or memorise A3-Antistasi outpost locations as they are not available in the Editor.<br/>
# Automated Actions
The Street Artist Editor helps the user avoid common problems.<br/>
There is no way to bypass these systems.<br/>
### 3. If there's no road path between two nodes, then one of the nodes should be off-road.
Every time the user connects two road nodes, it will a employ quick pathfinding check to determine whether there is a valid direct connection.<br/>
If not, it will add a middle node automatically.<br/>
### 4. Nodes cannot share the same road.
The minimum distance between two nodes is currently 16cm. This also means an off-road node needs to be at least 16cm from any road.<br/>
### 5. Nodes must be on top of bridges.
All added nodes in the Editor are placed on top of the highest surface.<br/>
The height above ground is displayed next to the cursor.<br/>
Take this into account for routes going under tunnels or overhangs.<br/>
To avoid any issues:
Place off-road nodes on both ends of the tunnel and hope the AI path safely between them.<br/>
Nodes snapped to roads will inherit the roads' height, therefore no intervention is required.<br/>

# GIFs
Street Artist- Set Road Types<br/>
![Street Artist- Set Road Types](https://media.giphy.com/media/BDeBqn3MbTLkmsbPgF/giphy.gif)<br/>
Street Artist- Connection & Creation Basics<br/>
![Street Artist- Connection & Creation Basics](https://media.giphy.com/media/WvcsqW3RxomeBnEpKw/giphy.gif)<br/>
Street Artist- Create Island<br/>
![Street Artist- Create Island](https://media.giphy.com/media/zgwHY479t1zDBiIuUd/giphy.gif)<br/>
Street Artist- Deletion brush<br/>
![Street Artist- Deletion brush](https://media.giphy.com/media/EYPzlX5Q1pIg5eU9qL/giphy.gif)<br/>
Street Artist- Re Route Roads<br/>
![Street Artist- Re Route Roads](https://media.giphy.com/media/KAtVRE2XGuXlRrdANi/giphy.gif)<br/>
Street Artist- Change Colour Division Mode<br/>
![Street Artist- Change Colour Division Mode](https://media.giphy.com/media/BpBRHPPRoMP9n9V0lH/giphy.gif)<br/>