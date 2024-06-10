function [dist, prev] = dijkstra0(adjMatrix, startNode)
    % 输入:
    % adjMatrix: 邻接矩阵，表示图的权重
    % startNode: 起点节点
    % 输出:
    % dist: 从起点到每个节点的最短距离
    % prev: 最短路径上每个节点的前驱节点

    numNodes = size(adjMatrix, 1); % 节点总数
    dist = inf(1, numNodes); % 距离数组，初始化为无穷大
    dist(startNode) = 0; % 起点到自己的距离为0
    prev = NaN(1, numNodes); % 前驱节点数组
    visited = false(1, numNodes); % 访问标记数组

    % Dijkstra算法
    for i = 1:numNodes
        % 选择未访问节点中距离起点最近的节点
        [~, u] = min(dist + visited * inf);
        visited(u) = true; % 标记为已访问

        % 更新距离
        for v = 1:numNodes
            if adjMatrix(u, v) > 0 && ~visited(v)
                alt = dist(u) + adjMatrix(u, v);
                if alt < dist(v)
                    dist(v) = alt;
                    prev(v) = u;
                end
            end
        end
    end
end