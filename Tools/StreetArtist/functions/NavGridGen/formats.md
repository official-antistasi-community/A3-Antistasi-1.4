
# navRoadHM
_From road extraction and distance application. Used in simplification._<br/>
```
<HASHMAP<         navRoadHM:
  <STRING>          Road string.
  <
    <OBJECT>          Road
    <ARRAY<OBJECT>>   Connected roads.
    <ARRAY<SCALAR>>   True driving distance in meters to connected roads.
    <ARRAY<OBJECT>>   Connected roads that have a forced connection. This array will not be in sync with other two arrays. The roads are exempt from simplification and are resolved in the road to navGrid conversion.
  >
>>
```
`[_name_,[_road_,_connectedRoads,_connectedDistances]]`
# navGridHM
_Speedy and fast writeable version of navGridDB, navGridHM connections are positions._<br/>
_Island ID may become inaccurate during editing in StreetArtist and will require a refresh._<br/>
```
HASHMAP<          NavFlatHM
  POSATL            Key is Road pos.
  ARRAY<
    <POSATL>          Road pos.
    <SCALAR>          Island ID.
    <BOOLEAN>         isJunction.
    <ARRAY<           Connections:
      <POS2D>           Connected road position.
      <SCALAR>          Road type Enumeration. {TRACK = 0; ROAD = 1; MAIN ROAD = 2} at time of writing.
      <SCALAR>          True driving distance to connection, includes distance of roads swallowed in simplification.
    >>
  >
>
```
`[_posATL,[_pos2D,_islandID,_isJunction,[_conPos2D,_roadEnum,_distance]]]`
# navGrdDB
_Desired output format saved for A3-Antistasi. navGridDB connections are array indices._<br/>
```
ARRAY<           navGridDB:
  <POSATL>          Road pos.
  <SCALAR>          Island ID.
  <BOOLEAN>         isJunction.
  <ARRAY<           Connections:
    <SCALAR>          Index in navGridDB of connected road.
    <SCALAR>          Road type Enumeration. {TRACK = 0; ROAD = 1; MAIN ROAD = 2} at time of writing.
    <SCALAR>          True driving distance to connection, includes distance of roads swallowed in simplification.
  >>
>
```
`[[_posATL,_islandID,_isJunction,[_conPos2D,_roadEnum,_distance]]]`
