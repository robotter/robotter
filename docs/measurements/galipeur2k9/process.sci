
MXY = fscanfMat("line_xy.data");
N = size(MXY,1);

// build graph
for it=1:N,
  // set x-axis in seconds
  GXY(it,1) = MXY(it,2) + MXY(it,3)/1000000,
  // compute travelled distance in mm
  GXY(it,2) = sqrt( MXY(it,4)^2 + MXY(it,5)^2 ),
end;

// compute speed
for it=2:N,
  GXY(it,3) = (GXY(it,2) - GXY(it-1,2))/(GXY(it,1)-GXY(it-1,1)),
end;

// plot distance
//plot(GXY(1:N,1),GXY(1:N,2));
//plot(GXY(1:N,1),GXY(1:N,3));

MA = fscanfMat("line_a.data");
N = size(MA,1);

// build graph
for it=1:N,
  // set x-axis in seconds
  GA(it,1) = MA(it,2) + MA(it,3)/1000000,
  // compute rotation in rads
  GA(it,2) = MA(it,4),
end;

// compute speed
for it=2:N,
  GA(it,3) = (GA(it,2) - GA(it-1,2))/(GA(it,1)-GA(it-1,1)),
end;

// plot angle
//plot(GA(1:N,1),GA(1:N,2));
plot(GA(1:N,1),GA(1:N,3));

