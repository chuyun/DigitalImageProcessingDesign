
function DoubleClick2Save(handles,hImage)



axes(handles.axes4);
hImage4=image(MosciaImage);
 setappdata(0,'hAxes4ImageMain',hImage4);
 set(hImage4,'ButtonDownFcn',@axes4_ButtonDownFcn);