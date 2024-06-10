using UnityEngine;
using System.IO;

public class ExportMapData : MonoBehaviour
{
    public string vertexFileName = "vertices.csv";
    public string edgeFileName = "edges.csv";

    void Start()
    {
        MeshFilter meshFilter = GetComponent<MeshFilter>();
        if (meshFilter != null)
        {
            Mesh mesh = meshFilter.mesh;
            Vector3[] vertices = mesh.vertices;
            int[] triangles = mesh.triangles;

            // Export vertices
            using (StreamWriter writer = new StreamWriter(vertexFileName))
            {
                writer.WriteLine("x,y,z");
                foreach (Vector3 vertex in vertices)
                {
                    writer.WriteLine($"{vertex.x},{vertex.y},{vertex.z}");
                }
            }

            // Export edges
            using (StreamWriter writer = new StreamWriter(edgeFileName))
            {
                writer.WriteLine("start,end");
                for (int i = 0; i < triangles.Length; i += 3)
                {
                    writer.WriteLine($"{triangles[i]},{triangles[i + 1]}");
                    writer.WriteLine($"{triangles[i + 1]},{triangles[i + 2]}");
                    writer.WriteLine($"{triangles[i + 2]},{triangles[i]}");
                }
            }

            Debug.Log("Map data exported to " + vertexFileName + " and " + edgeFileName);
        }
        else
        {
            Debug.LogError("MeshFilter not found!");
        }
    }
}
