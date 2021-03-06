using System.Windows.Shapes;

namespace Shift2
{
    public class Element
    {
        public Element(string name, Polygon polygon)
        {
            this.Name = name;
            this.Polygon = polygon;
        }

        public string Name { get; }
        public Polygon Polygon { get; }
    }
}