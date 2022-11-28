# 🍞 MyBakering - 레시피 공유 앱
나만의 베이킹 레시피를 저장하고, 사람들과 공유하고, 또 보고싶은 레시피를 북마크하세요!
<br/><br/>

## General Information
> 🔍 왜 `마이베이커링` 앱을 만들었나요?

저는 베이킹을 정말 좋아합니다!
<br/>(특히 마들렌과 베이글을 만들어서 주변 사람들에게 나눠주고 맛있어하면 행복합니다 🥰)
<br/><br/>취미로 베이킹을 할 때마다 매번 여러 플랫폼에서 레시피를 검색해야했습니다.
<br/>요리 레시피를 공유하는 앱은 다수 존재하지만, 베이킹만을 위한 앱은 없었습니다.
<br/>그럴 때마다 **베이킹 전용 레시피 앱**이 있으면 좋겠다고 생각했고, `마이베이커링`을 만들게되었습니다!
<br/><br/>

> 🔍 프로젝트를 진행하면서 들었던 생각이나 소감을 알려주세요!

🐥 개발 공부를 시작하고, 처음으로 만든 앱입니다!
<br/>먼저, 공부하면서 즐거워하는 제 모습이 너무 행복해 보였고,
<br/>2달간 열심히 공부한 `SwiftUI`를 녹여낼 수 있어서 의미 있었습니다.
<br/><br/>원하는 UI와 기능을 직접 구현하여 내 핸드폰에서 사용해 보면서 정말 신기했습니다.
<br/>👥 가족들과 친구들이 제가 만든 앱을 실제로 사용해 보고 피드백을 주었는데,
<br/>피드백을 받고 어떻게 코드를 써야할지, 어떤 기능을 추가해야 할지 생각하고 즐거워하며
<br/>개발 공부에 푹 빠진 제 모습을 보고 놀라웠습니다.
<br/><br/>**📚 앞으로 어떤 공부를 해야 할지, 내가 무엇을 좋아하는지 알게 해준 계기가 되었습니다.**
<br/><br/>


## Technologies Used
+ iOS 16.0, Xcode 14.1
+ `SwiftUI` : 앱의 모든 UI 구현
+ `Firebase`
  + `Firebase Authentication` : 계정 생성, 로그인/로그아웃 구현
  + `Firestore Database` : user와 recipe 정보 저장
<br/> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
<img src="https://user-images.githubusercontent.com/117328806/204220453-c299d5aa-87c5-4608-b606-b4031c9d2aa9.png"  width="400"> <br/>
  + `Storage` : profile image, recipe image 저장
+ Design : [figma](https://www.figma.com/file/v8H64K7yTDXFijIwbak1jH/MyBakering?node-id=0%3A1&t=4nIqD30GusTYJuFc-1)
<br/><br/>

## Features
+ 계정 생성, 로그인∙로그아웃
+ 피드 : 사용자들이 공유한 모든 레시피
+ 카테고리 : 카테고리별 레시피
+ 레시피 : 레시피 상세 정보 
+ 새로운 레시피를 추가 : 레시피의 사진, 이름/설명/카테고리, 재료, 과정 저장
+ 마이페이지
  + 또 보고싶은 레시피 북마크
  + 프로필 사진을 지정, 변경
<br/><br/>

## Screenshots
+ 피드, 카테고리, 레시피 상세 정보
<br/> <img src="https://user-images.githubusercontent.com/117328806/204206516-899c7512-c9ad-4873-a870-b5acd9c22f2f.png"  width="209" height="455">  <img src="https://user-images.githubusercontent.com/117328806/204206588-98f7ec22-3933-4229-84f5-f8ba9b82ca2a.png"  width="209" height="455">  <img src="https://user-images.githubusercontent.com/117328806/204206542-a6cfa268-bacf-4e81-a11a-dbf8e2e9f787.png"  width="209" height="455">  <img src="https://user-images.githubusercontent.com/117328806/204206567-e2baba5e-6ee6-4fa9-ba68-ec5a941f8e32.png"  width="209" height="455"> <br/><br/>

+ 레시피 추가
<br/> <img src="https://user-images.githubusercontent.com/117328806/204206609-a370de1a-699c-473d-af9b-c8ea7e87fe4c.png"  width="209" height="455">  <img src="https://user-images.githubusercontent.com/117328806/204237415-ef59dc1c-6671-4df8-a99c-395cf2bf7f71.png"  width="209" height="455">  <img src="https://user-images.githubusercontent.com/117328806/204237393-8f2c6127-4293-4fb3-9d46-45ec48892a23.png"  width="209" height="455"> <br/><br/>

+ 로그인, 계정 생성, 마이페이지
<br/> <img src="https://user-images.githubusercontent.com/117328806/204206737-cd3c4592-e05f-4e22-89c6-beba59dde9bd.png"  width="209" height="455">  <img src="https://user-images.githubusercontent.com/117328806/204206756-3cbf54ea-29bd-4328-8a10-08bc257ccbf4.png"  width="209" height="455">  <img src="https://user-images.githubusercontent.com/117328806/204206617-58d2e711-3488-49e1-86e1-548933193e2a.png"  width="209" height="455">
<br/><br/>

## Project Status / To do
프로젝트 상태
+ v1.0.0 앱스토어 심사 준비 중
+ v1.1.0 진행 중

#### To do
앞으로 추가하려는 기능
- [ ] 다크모드 지원
- [ ] 레시피 검색
- [ ] 재료 추가 시, 재료명과 재료의 양을 분리하여 입력
- [ ] 불쾌한 내용이 담긴 레시피 신고

+ 계정 관련
  + - [ ] 닉네임 변경
  + - [ ] 비밀번호 변경
  + - [ ] 계정 삭제
