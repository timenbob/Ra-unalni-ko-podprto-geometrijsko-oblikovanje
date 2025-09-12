P = [-5 0; -2 -1; 0 3; 3 0; 7 -1];
ue = alphaparam(P,0)
uc = alphaparam(P,0.5)
ut = alphaparam(P,1)

z = zeros(1,5);
hold on
plot(ue,z-2,'ro-','MarkerEdgeColor','k','MarkerFaceColor','k');
plot(uc,z,'go-','MarkerEdgeColor','k','MarkerFaceColor','k');
plot(ut,z+2,'bo-','MarkerEdgeColor','k','MarkerFaceColor','k');