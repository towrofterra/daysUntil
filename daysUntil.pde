int numDays = 0;
int size = 30;
int startDay = 0;

void setup() {
  size(661, 510);
  surface.setTitle("Enter number of days. Use '+' and '-' to change the starting day.");
}

void draw() {
  background(200);
  int x = 0;
  int y = 0;
  int numSquares = 0;
  for (int i=0; i < height/size; i++) {
    for (int j=0; j < width/size; j++) {
      fill(255);
      if((numSquares - 5 + startDay) % 7 == 0 || (numSquares + 1 + startDay) % 7 == 0)//if weekend
        fill(255, 255, 0);
      square(x, y, size);
      fill(0);
      text(numSquares+1, x+2, y+size-2);
      numSquares++;
      if (numSquares >= numDays) {
        //print("DONE");
        return;
      }
      x+=size;
    }
    y+=size;
    x=0;
  }
}



void keyPressed() {
  if (key == 45){ // If key is '-', move day of the week backwards
    startDay++;
  }
  if (key == 61){ // If key is '=', move day of the week forwards
    startDay--;
  }
  if (key == 115) { // If key is 's', save
    save("calendar.jpg");
    surface.setTitle("SAVED");
    return;
  }
  else if (keyCode == BACKSPACE) {
    numDays = numDays / 10;
  } else if (key >= 48 && key <= 57) {
    numDays = numDays * 10 + key-48;
    if(numDays >= 366)
      numDays = 366;
  }
  surface.setTitle("Number of Days: " + str(numDays));
}
