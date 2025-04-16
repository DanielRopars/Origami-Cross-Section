clf
xPoints = [0];
%makes an array of the various xs we go to, so as to find which is the
%largest.
%ensures you're working with a clear plot.
vertexAngles = [2,3,2,1];
%defines vertex in terms of the angles between its vertices a1 and aN.
vertexMV = ["v","v","v","m"];
%defines vertex mv arrangement, where vertexMV(1) is the vertex between
%vertexAngles a1 and a2, and the last index is between aN and a1.
layerHeights = ones(length(vertexAngles),1);
%defines how much we move on y with each turn.
direction = 1;
%states that our direction is "positive."
points = [0,0];
%creates an array of the points we'll be graphing.

%gets our xs to find the biggest and smallest
flip = 1;
for i = 2:length(vertexAngles)
    newPointX = xPoints(end) + flip * vertexAngles(i);
    xPoints = [xPoints,newPointX];
    flip = flip * -1;

end
%makes our layer heights fit with our hypothesis
xPoints
tempDir = 1;
upMoves = 0;
downMoves = 0;
for i = 1:length(vertexAngles)
    if (tempDir == 1 && vertexMV(i) == "m") | (tempDir == -1 && vertexMV(i) == "v")
        tempDir = -1 * tempDir;
        upMoves = upMoves + 1;
    else
        tempDir = -1 * tempDir;
        downMoves = downMoves + 1;
    end
end

[fakeVar, maxX] = max(xPoints);
[fakeVar,minX] = min(xPoints);
degree = length(vertexAngles);
%swap these two assignments if it doesn't work and you think it should-- 
layerHeights(maxX) = downMoves;
layerHeights(minX) = upMoves;
layerHeights

%function that make our points to graph :)
for i = 1:length(vertexAngles)
    newPointX = points(end,1) + direction * vertexAngles(i);
    newPointY = points(end,2);
    newPoint = [newPointX,newPointY];
    points = [points;newPoint];
    %moves right equal to vertexAngle if facing right, left if left, and
    %adds it to the points.
    if (direction == 1 && vertexMV(i) == "m") | (direction == -1 && vertexMV(i) == "v")
        direction = direction * -1;
        newPointX = points(end,1);
        newPointY = points(end,2) + layerHeights(i);
        newPoint = [newPointX,newPointY];
        points = [points;newPoint];
    else
        direction = direction * -1;
        newPointX = points(end,1);
        newPointY = points(end,2) - layerHeights(i);
        newPoint = [newPointX,newPointY];
        points = [points;newPoint];
    end
    %determines whether its turn will move it upward or downward, then
    %moves it that far. 

end
points
xsize = [length(points)];
hold on

for i = 1:(xsize - 1)
    plot( [points(i,1) points(i+1,1 )] ,[points(i,2) points((i+1),2)] )
end
hold off