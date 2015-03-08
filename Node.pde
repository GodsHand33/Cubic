float K = 0.5;
float damping = 0.9;
float randomness = 20;

class Node
{
  PVector position;
  PVector velocity;
  private PVector target;

  int indexX;
  int indexY;
  int indexZ;

  Node(int x, int y, int z)
  {
    indexX = x;
    indexY = y;
    indexZ = z;
    position = new PVector(width/(tileCountX - 1) * x, height/(tileCountY - 1) * y, width/(tileCountX - 1) * z);
    velocity = new PVector();
    target = position;
  }

  void update()
  {
    movement();
    render();
    drawLines();
  }

  public void shake()
  {
    float angle = random(0, TWO_PI);
    position = new PVector(position.x + cos(angle) * randomness, position.y + sin(angle) * randomness, position.z);
  }

  void movement()
  {
    PVector diff = PVector.sub(target, position);
    diff.mult(K);
    velocity.add(diff);
    velocity.mult(damping);
    position.add(velocity);
  }

  void render()
  {
    noStroke();
    fill(0);
    pushMatrix();
    translate(position.x, position.y, position.z);
    sphere(2);
    popMatrix();
  }

  void drawLines()
  {

    stroke(200);
    strokeWeight(1);

    if (nodeHashMap.containsKey(new PVector(indexX + 1, indexY, indexZ)))
    {
      Node node = nodeHashMap.get(new PVector(indexX + 1, indexY, indexZ));
      line(position.x, position.y, position.z, node.position.x, node.position.y, node.position.z);
    }

    if (nodeHashMap.containsKey(new PVector(indexX, indexY + 1, indexZ)))
    {
      Node node = nodeHashMap.get(new PVector(indexX, indexY + 1, indexZ));
      line(position.x, position.y, position.z, node.position.x, node.position.y, node.position.z);
    }

    if (nodeHashMap.containsKey(new PVector(indexX, indexY, indexZ + 1)))
    {
      Node node = nodeHashMap.get(new PVector(indexX, indexY, indexZ + 1));
      line(position.x, position.y, position.z, node.position.x, node.position.y, node.position.z);
    }
  }
}

