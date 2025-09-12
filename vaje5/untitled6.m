% Example control points for the Bézier curve
B = [0 0; 2 3; 4 2; 5 -1];
BS1 = beziersubK(B,0.5,1);
[BS1{1} BS1{2}];

BS2 = beziersubK(B,0.5,2);
[BS2{1}{1} BS2{1}{2}]
[BS2{2}{1} BS2{2}{2}]