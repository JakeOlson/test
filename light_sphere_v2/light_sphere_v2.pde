OPC opc;
PImage im;

void setup()
{
  size(1000, 800);

  // Load a sample image
  im = loadImage("clover.jpg");

  // Connect to the local instance of fcserver
  opc = new OPC(this, "127.0.0.1", 7890);

  // Map one 64-LED strip to the center of the window
 // opc.ledStrip(0, 18, width/2, height/2, width / 80.0, 0, false);

  opc.ledGrid(0, 18,4, width/2, height/2, width / 18.0, height/18.0 , 0, false);
}
void draw()
{
  // Scale the image so that it matches the width of the window
  int imHeight = im.height * width / im.width;

  // Scroll down slowly, and wrap around
  float speed = 0.1;
  float x = (millis() * -speed) % width;
  
  // Use two copies of the image, so it seems to repeat infinitely  
  image(im, x, 0, width, imHeight);
  image(im, x+ width, 0 , width, imHeight);
}