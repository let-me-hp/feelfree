% 主脚本文件

% 导入顶点数据
vertexData = readmatrix('vertices.csv');
vertices = vertexData(:, 1:3);

% 导入边数据
edgeData = readmatrix('edges.csv');
edges = edgeData + 1; % MATLAB索引从1开始

% 构建邻接矩阵
numVertices = size(vertices, 1);
adjMatrix = inf(numVertices, numVertices);

for i = 1:size(edges, 1)
    startNode = edges(i, 1);
    endNode = edges(i, 2);
    distance = norm(vertices(startNode, :) - vertices(endNode, :));
    adjMatrix(startNode, endNode) = distance;
    adjMatrix(endNode, startNode) = distance; % 无向图
end

for i = 1:numVertices
    adjMatrix(i, i) = 0;
end

% 设置起始节点
startNode = 1; % 根据需要调整起始节点

% 运行Dijkstra算法
[dist, prev] = dijkstra0(adjMatrix, startNode);

% 显示结果
disp('最短距离：');
disp(dist);
disp('前驱节点：');
disp(prev);