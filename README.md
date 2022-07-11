# 2022 Mini_drone 배민one

* Edge 검출, 이미지 좌표화, 다항식 회귀분석을 활용한 배민one 2022 기술 워크샵

* 드론이 장애물을 통과하는 과정을 두 단계로 나누었다
  * 드론과 과녁의 중심점 정렬 (Edge 검출 함수, 이미지 좌표화)
  * 회귀분석을 통해 전진 거리 설정

* Team 배민one
  * [김준엽](https://github.com/junyeobkim55) [임종건](https://github.com/Lim-Jong-geon)
  
***
  
## 목차

1. 사용 패키지    
2. 파일 구조    
3. 대회 진행 전략   
4. 중심점 찾기 알고리즘      
5. 각 단계별 과정    
6. 소스 코드

***

## 1. 사용 패키지

* [MATLAB Support Package for Ryze Tello Drones](https://kr.mathworks.com/matlabcentral/fileexchange/74434-matlab-support-package-for-ryze-tello-drones?s_tid=srchtitle)
* [MATLAB Image Processing Toolbox](https://kr.mathworks.com/products/image.html)

## 2. 파일 구조

  ```
  추후작성
  ```

## 3. 대회 진행

### 1. 장애물 중심점 탐색

  * 전략 : 카메라에 찍히는 장애물의 사진을 세 가지로 분류
    
  > 1. 장애물의 통과 부분(구멍)이 보이지 않는 경우
    장애물의 통과 부분이 보이지 않는 경우에는 카메라에 찍힌 장애물의 일부 부분만을 사진을 이진화 하여 추출한다.
    추출한 영역의 질량 중심을 regionprops함수를 이용하여 지정하고 드론을 지정한 중심 방향으로 이동시켜 장애물의 통과부분이 카메라 안에 들어오도록 유도한다.
  
  > 2. 통과 부분의 일부가 보이는 경우
    통과 부분의 일부가 보이는 경우에는 장애물의 edge를 각각 검출하여 구멍의 edge만을 추출한다.
    추출한 edge의 질량 중심을 regionprops함수를 이용하여 지정하고 드론을 지정한 중심 방향으로 이동시켜 궁극적으로는 통과부분이 온전히 카메라 안에 들어오도록 유도한다.
  
  > 3. 통과 부분이 온전히 보이는 경우
    중심점 찾기 코드를 적용하여 드론의 카메라 중심점과 장애물의 중심점을 일치시킨다.

### 2. 회귀분석을 통한 거리 계산 & 카메라 y축 보상
  
  * 전략 : 다항식 회귀분석을 통해 거리를 계산하고 구한 거리를 통해 y축 오차를 보상한다.
  
  > 1. 정확한 거리 측정을 위해 파란색 원을 출력하여 다양한 거리에서 촬영하였다. 거리에 따른 픽셀 수의 변화를 1/(이차함수) 형태로 fitting 하였고
    이후 실제 장애물 원 크기에 맞추어 scaling 을 진행하였다.
   
  > 2. 드론의 카메라가 하단부를 향하고 있어 카메라 중심과 장애물의 중심점을 정렬하여도 부득이한 y축 오차가 발생한다.
    카메라의 각도와 회귀분석을 통해 구한 거리를 통해 y축 오차만큼 드론을 하강한다.
    
***

![center classify flowchart](/image/centerclassify.png)

> * 장애물의 사진을 분류하는 flowchart (빨간색 점은 질량 중심)
> * 지령은 장애물 통과 부분의 중심점을 의미

***

![regression_50 plot](/image/regression_50.png)

> * 처음에는 [pixel] = a/(distance) + k 의 유리함수 형태로(a,k는 상수) 회귀분석을 진행하였으나 그래프의 기울기가 급격하여 가까운 1~2m의 가까운 거리에서 적절하지 않았다. 따라서 1/(ax^2+bx+c) 함수로 회귀분석을 진행하였다. 
> * 1~3m 의 데이터 만을 사용하였다.

## 4. 중심점 찾기 알고리즘

 * 통과부분이 온전히 카메라 안에 들어온 후에 중심점을 찾는 알고리즘
   * 이미지 좌표화
  > (예시로는 사각형 장애물을 사용) 통과부분의 edge를 추출하고 edge의 centroid를 직교좌표계의 원점으로 한다. 이를 통해 사각형의 각 꼭짓점이 각각의 사분면에 위치하게 할 수 있다.
  
  ![coordinate](/image/coordinate.jpg)
  
  > 각 사분면에 따라 최댓값의 좌표를 갖는 지점을 꼭짓점으로 잡는다. 이 때 최댓값의 좌표가 여러 개가 나올 경우 평균화를 진행한다.
  
  ![coordinate2](/image/coordinate2.jpg)
  
 
  ![coordinate3](/image/coordinate3.jpg)
 
  > 1,3 사분면 꼭짓점의 중점과 2,4 사분면 꼭짓점의 중점을 구하고 구한 두 중점을 평균화하여 최종적으로 **지령**(초록색 점)을 생성한다.
  
  ![coordinate4](/image/coordinate4.jpg)
  
## 5. 각 단계별 과정













