function V = vectorbary(P, T)

o = pointbary([0 0], T);
p1 = pointbary(P,T);

V = p1-o;
end