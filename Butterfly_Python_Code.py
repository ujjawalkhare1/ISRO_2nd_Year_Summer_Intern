import cv2
import numpy as  np
import math


def wing_outline(img):
    gray_img = img
    x = np.size(img,0)
    y = np.size(img,1)
    th= 5
    img1 = np.ones([x-1,y-1], dtype = "uint8") * 255 
    print(x)
    print(y)
    global im 
    im = cv2.Canny(img,75,200)
    im2, contours, hierarchy = cv2.findContours(im.copy(), cv2.RETR_TREE, cv2.CHAIN_APPROX_SIMPLE)
    for c in contours:
        if cv2.contourArea(c) < th:
                cv2.drawContours(img1, [c], -1, 0 ,-1)
    #image = cv2.bitwise_and(image, image, mask = mask) 
    
    cv2.imshow("bschbv", im)
    cv2.waitKey(200000)
    cv2.destroyAllWindows()
    return  

def max_distance(x0,y0):
    maximum = 0
    w = np.size(im,0)
    h = np.size(im,1)
    for x in range(w):
        for y in range(h):
            if im[x][y] == 255 :
                if ((pow( x-x0 , 2) + pow (y - y0 , 2)) > maximum):
                    maximum = pow( x-x0 , 2) + pow (y - y0 , 2)
                    x_max= x
                    y_max= y 
    return maximum, x_max, y_max

def max_distance_points():
    
   
    w = np.size(im,0)
    h = np.size(im,1)
    max_dist=0
    x1=0 
    x2=0 
    y1=0 
    y2=0
    dist = np.zeros([w, h], dtype = int)
    for x in range(int(w-1)):
        for y in range(int(h-1)):
            if im[x][y] == 255 :
                dist[x][y],a , b = max_distance(x,y)
                if(dist[x][y] > max_dist):
                    max_dist = dist[x][y]
                    x1 = x
                    y1 = y
                    x2 = a
                    y2 = b
                    
                    
    
    xc= (x1+ x2)/2.0
    yc= (y1+ y2)/2.0    
    x3 = (0.2 * x1 + 0.3 * xc)/ 0.5
    y3 = (0.2 * y1 + 0.3 * yc)/ 0.5
    
    x4 = (0.2 * x2 + 0.3 * xc)/ 0.5
    y4 = (0.2 * y2 + 0.3 * yc)/ 0.5
    
                  
    return x3, y3, x4, y4

def area(x3, y3, x4 , y4):
    x_area = np.zeros( [6], dtype= int)
    y_area = np.zeros( [6], dtype= int)
    x1 = np.size(im,0)
    y1 = np.size(im,1)
    y=0
    c=0
    for i in range(y1):
        
        y = int((-1.0 * (y4-y3))/(x4 - x3) * (i-y3) + x3)
        #print("1st",i,y)
        
        if(y< 0 or c==2):
            break
        if ( im[y][i] == 255) :
            x_area[c]= i
            y_area[c]= y
            c += 1
    
    for i in range(0, y1):
        y = int(-1.0 * (y4-y3)/(x4 - x3) * (i-y4) + x4)
        #print("2nd",i,y)
       
        if ( im[y] [i] == 255 ):
            x_area[c]= i
            y_area[c]= y 
            c +=1
            
    
    return x_area, y_area

def minimum_distance(x0 , y0, x_area, y_area):
    
    dist_min = 0
    for i in range (x_area[1], x_area[3]):
        for j in range(y_area[1], y_area[3]):
            if im[i][j] == 255 :
                dist = pow( x0 - i , 2) + pow ( y0 - j , 2)
                if dist < dist_min :
                    dist_min = dist
                    x_min = i
                    y_min = j
        
    return x_min, y_min , dist_min
    
def minimum_distance_points(x_area, y_area):
   
    for i in range( x_area[0], x_area[2]):
        for j in range ( y_area[0], y_area[2]):
            if ( im[i][j] == 255):
                x_min, y_min, min_dist = minimum_distance( i, j, x_area, y_area)
                if min_dist < abs_min_dist :
                    abs_min_dist = min_dist
                    abs_x_centre = (x_min + i)/2.0
                    abs_y_centre = (y_min + j)/2.0
                    m = (x_min - abs_x_centre) / (y_min - abs_y_centre)  
    print(abs_x_centre, abs_y_centre)
    return abs_x_centre, abs_y_centre, m

def length_probability(abs_x_centre, abs_y_centre, m):
    li = np.zeros([360] , dtype = float)
    p_li = np.zeros([360] , dtype = float)
    s = np.zeros([36] , dtype = float)
    s_max = 0
    
    sum_li = 0
    
    for i in range(abs_x_centre):
        y = int (m * i + abs_y_centre - m * abs_x_centre)
        inv_m = math.atan(m)
        inv_m = inv_m + 3.14159/180
        m = math.tan(inv_m)
        if im[i][y] ==255:
            li = math.sqrt(pow( i-abs_x_centre , 2) + pow( j - abs_y_centre))
            sum_li += li
        
    for i in range(abs_x_centre, np.size(im, 0)):
        y = m * i + abs_y_centre - m * abs_x_centre
        inv_m = math.atan(m)
        inv_m = inv_m + 3.14159/180
        m = math.tan(inv_m)
        if im[i][y] ==255:
            li = math.sqrt(pow( i-abs_x_centre , 2) + pow( j - abs_y_centre))
            sum_li += li
    
    for i in range(1,360):
        p_li[i] = li* 1.0 / sum_li
        for j in range(i):
            s[i-1] += 1.0 * p_li[j] * math.log(p_li[j])/ math.log(i+1)
            s[i-1] = -1 * s[i-1]
            s_max = max(s_max, s[i])
        if i==1:
            s_min = s[i]
        else :
            s_min = min(s_min , s[i])
            
    
    for i in range(360):
        s[i] = (s[i] - s_min) * 1.0 / ( s_max - s_min)
        
    return
                        
                        
                        
    
test_img1=cv2.imread("C:/Users/trainee2018090/AppData/Local/Continuum/test.jpg",0)
wing_outline(test_img1)
#max_distance_points()
x3, y3, x4, y4 = (50.3, 23.400000000000002, 114.7, 42.6)

#print(x3, y3, x4 , y4)
x_area, y_area = area(x3, y3 , x4 , y4)
print(x_area, y_area)

