color defaultLineColor = color(0);

Carbon[] baseChain;

int numCarbons = 10;

void setup() {
  size(800, 600);
  strokeWeight(2);

  baseChain = new Carbon[numCarbons];

  baseChain[numCarbons-1] = new Carbon();

  for (int i = numCarbons-2; i >= 0; i--) {
    baseChain[i] = new Carbon();
    baseChain[i].addChild(baseChain[i+1]);
  }

  // A methyl, ethyl and butyl
  baseChain[1].addChild(makeCarbonChain(1, #FF0000));
  baseChain[2].addChild(makeCarbonChain(2, #00FF00));
  baseChain[5].addChild(makeCarbonChain(4, #0000FF));
}

void draw() {
  background(255);
  baseChain[0].drawChildren(new PVector(100, height/2), PI/6);
}

Carbon makeCarbonChain(int n, color lineColor) {
  Carbon chain = new Carbon(lineColor);
  if (n > 1)
    chain.addChild(makeCarbonChain(n-1, lineColor));
  return chain;
}

Carbon makeCarbonChain(int n) {
  return makeCarbonChain(n, defaultLineColor);
}