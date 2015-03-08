import peasy.*;

PeasyCam cam;
HashMap<PVector, Node> nodeHashMap;

int tileCountX = 6;
int tileCountY = 6;
int tileCountZ = 6;

void setup()
{
  size(800, 800, P3D);

  cam = new PeasyCam(this, 0.5f * width, 0.5f * height, 0.5f * width,  800);
  cam.setMinimumDistance(0);
  cam.setMaximumDistance(1600);

  nodeHashMap = new HashMap<PVector, Node>();


  for (int k = 0; k < tileCountZ; k++)
  {
    for (int j = 0; j < tileCountY; j++)
    {
      for (int i = 0; i < tileCountX; i++)
      {
        Node n = new Node(i, j, k);
        nodeHashMap.put(new PVector(i, j, k), n);
      }
    }
  }
}

void draw()
{
  //  fill(255, 50);
  //  rect(0, 0, width, height);

  background(255);

  pushMatrix();

//  translate(-0.5f * width, -0.5f * height, -0.5f * width);

  for (Node node : nodeHashMap.values ()) {
    node.update();
  }

  popMatrix();
}

void keyPressed()
{
  for (Node node : nodeHashMap.values ()) {
    node.shake();
  }
}

