clf
%ensures you're working with a clear plot.
vertexAngles = [3,3,3,3];
%defines vertex in terms of the angles between its vertices a1 and aN.
vertexMV = ["m","v","m","m"];
%defines vertex mv arrangement, where vertexMV(1) is the vertex between
%vertexAngles a1 and a2, and the last index is between aN and a1.
layerHeights = [1,1,1,3];
%defines how much we move on y with each turn.
direction = 1;
%states that our direction is "positive."
points = [0,0];
xpoints = [];
%creates an array of the points we'll be graphing.
upMoves = 0;
downMoves = 0;
%counts how many times we go upward or downward to test the Cool
%Hypothesis.
for i = 1:length(vertexAngles)
    newPointX = points(end,1) + direction * vertexAngles(i);
    xpoints = [xpoints,newPointX];
    newPointY = points(end,2);
    newPoint = [newPointX,newPointY];
    points = [points;newPoint];
    %moves right equal to vertexAngle if facing right, left if left, and
    %adds it to the points.
    if (direction == 1 && vertexMV(i) == "m") | (direction == -1 && vertexMV(i) == "v")
        upMoves = upMoves + 1;
        direction = direction * -1;
        newPointX = points(end,1); 
        newPointY = points(end,2) + layerHeights(i);
        newPoint = [newPointX,newPointY];
        points = [points;newPoint];
    else
        direction = direction * -1;
        downMoves = downMoves + 1;
        newPointX = points(end,1);
        newPointY = points(end,2) - layerHeights(i);
        newPoint = [newPointX,newPointY];
        points = [points;newPoint];
    end
    %determines whether its turn will move it upward or downward, then
    %moves it that far. 
upMoves 
downMoves
 

end
xpoints
%we made xpoints to check out where we need to extend our ys!
[xsize, ysize] = size(points);
hold on
for i = 1:(xsize - 1)
    plot( [points(i,1) points(i+1,1 )] ,[points(i,2) points((i+1),2)] )
end
hold off
upMoves
downMoves