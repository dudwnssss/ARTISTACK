## ARTISTACK - 아티스택
![image](https://github.com/dudwnssss/ARTISTACK/assets/76581866/a9b8b6b0-2473-4843-90d0-9558ab0b7ef3)

## Topic
- **[Artistack - 뮤지션을 위한 음악 협업 플랫폼]**
- **맡은 역할** :  iOS 리드 개발, 서비스 기획, PM (UMC 2기 - 디자이너 1명, 서버 3명, iOS 3명)
- **개발 기간** : 2022.06 ~ 2022.09 (3개월)
- 전체 프로젝트 1인 리팩토링 진행 중

## Main Functions
1. 소셜 로그인, 자동 로그인
2. 숏폼 컨텐츠 재생
3. 연주영상 녹화 및 업로드
4. 연주영상과 음악 병합
5. 게시물 좋아요 및 정보보기
6. 프로필 사진 업로드

## Tech
- **Language** : Swift
- **Architecture** : MVVM Input/Output Pattern
- **Reactive** : RxSwift, RxCocoa
- **UI** : CodeBase, Snapkit, Custom View
- **etc** : AVFoundation, AVKit, Social Login, RxDataSource, PHPicker

## Experience
- **AVFoundation**:  AVMutableComposition을 활용한 비디오 오디오 병합 기능 구현
  AVQueuePlayer를 사용하여 페이징이 가능한 숏폼 UI 구현
AVVideoPlayer, AVAudioPlayer
    
- **커스텀 카메라 구현**
Apple 공식 문서를 기반으로 **** AVFoundadtion의 활용하여 ****카메라 전환, 타이머, 다시재생 기능 등을 포함한 동영상 녹화용 커스텀 카메라를 구현
동영상 촬영 중 음악재생 기능을 구현

-  **RxDataSource 적용**
    RxDataSource를 활용하여 열거형을 활용하여, MultiSection MultipleCell 컬렉션뷰 구현. Animation효과를 통한 사용자 경험 향상
    
- **소셜 로그인 구현** 
    Apple Login 및 Kakao Login 구현, Alamofire의 interceptor를 활용하여, accessToken 만료 시, 자동으로 토큰 재발급 구현
    
- **Alamofire 추상화 및 네트워크 통신 모듈화**
URLRequestConvertible을 채택, ****Router 패턴을 활용하여 Network Layer를 추상화. 재사용성과 확장성 확보 및 개발시간 단축

-  **Multipart form data** 
    동영상 업로드, 프로필 사진 업로드를 위해 Multipart Form 형태로  서버 통신
    보다 개선된 ImagePicker기능이 도입된 PHPicker를 사용하여 갤러리 접근


## Trouble Shooting
- **Apple 로그인 Authrization Code, Idendtity Token**: <br>
서버측에서 애플 로그인을 통한 사용자 식별과, 온보딩 후, 회원가입 시 서버에게 Authorization Code를 보내는 방식으로 구현하려 했으나, Authrization Code는 애플로그인 시 한번만 발급받을 수 있기 때문에, 회원가입 시 한번 더 애플로그인을 해야하는 문제가 발생. 애플 로그인의 인증은 서버에 Identity Token을 보내서 애플에게 유효성 검사를 요청하는 방식으로 처리하고, 회원가입 시에는 Authorization Code를 사용해 Access Token과 Refresh Token을 얻는 방법으로 해결


- **AVMutableCompostion 영상과 음악의 싱크 문제**: <br>
AVMutableFoundation을 사용하여, 연주영상과 음원을 병합하는 기능을 구현했습니다. 하지만 최종 병합된 영상에서는 연주영상이 음원보다 0.5초 정도 느리게 병합되는 동기화 문제가 발생했습니다. 디버깅을 통해 카메라의 녹화 시점은 문제가 없음을 파악하였고, 영상 녹화시, 음원이 약 0.5초 느리게 재생되는 문제를 발견했습니다. 
APPLE은 공식문서를 통해 0.1초의 지연을 추가하는 것을 권장하고 있었고, 1분가량의 숏폼 영상을 녹화하는 데, 1초 정도의 딜레이를 주는 것이 적합하다고 판단하여, 문제를 해결하였습니다.



## ScreenShots
![image](https://github.com/dudwnssss/ARTISTACK/assets/76581866/0f251c5e-1d17-43ba-8fec-0ef8878c7d90)
![image](https://github.com/dudwnssss/ARTISTACK/assets/76581866/ece706b1-ed20-4976-8cd9-506fa7b493e6)
![artistack](https://github.com/dudwnssss/ARTISTACK/assets/76581866/9b936832-fd99-454c-919c-2dd19412e0cf)
![image](https://github.com/dudwnssss/ARTISTACK/assets/76581866/4136e03f-46f0-481f-963a-8ad42b1ab455)
