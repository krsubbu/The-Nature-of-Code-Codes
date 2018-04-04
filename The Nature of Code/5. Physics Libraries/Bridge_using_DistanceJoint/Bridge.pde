class Bridge {

  ArrayList<Link> links;
  float totalLength;
  float numPoints;
  float h;

  Bridge(float l_, float n_,float h_) {
    totalLength = l_;
    numPoints = n_;
    h = h_;

    links = new ArrayList();
    float len = totalLength/numPoints;

    for (int i=0; i<numPoints+1; i++) {
      Link l = null;

      if (i==0 || i==numPoints)
        l = new Link(i*len, h,10, true);
      else
        l = new Link(i*len, h,10, false);
      links.add(l);

      if (i>0) {   
        DistanceJointDef djd = new DistanceJointDef();
        println(i);
        Link prev = links.get(i-1);
        djd.bodyA = prev.body;
        djd.bodyB = l.body;

        djd.length = box2d.scalarPixelsToWorld(len);
        djd.frequencyHz = 0;
        djd.dampingRatio = 0;

        DistanceJoint dj = (DistanceJoint)box2d.createJoint(djd);
      }
    }
  }

  void display() {
    for (Link l : links) {
      l.display();
    }
  }
}