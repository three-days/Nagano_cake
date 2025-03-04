
# **ながのCAKE**
長野県にある小さな洋菓子店「ながのCAKE」の商品を通販するためのECサイト


## Description
Instagramから人気となり、全国から注文が来るようになったため、
情報の管理機能を含んだ通販サイト


## Dependency

>  Ruby on rails (5.2.4) 
>  HTML&CSS  
>  Javascript


## Usage
会員側実装機能
- 顧客は会員登録、ログイン・ログアウト、退会ができる
- 会員のログインはメールアドレスとパスワードで行う
- 会員がログインしている状態かどうか、ページのヘッダーにユーザ名を表示するなどして判断できるようにする
- サイトの閲覧はログインなしで行える
- 商品をカートに入れ、1度に複数種類、複数商品の購入ができること。また、カート内の商品は個数変更・削除ができる
- カートへの商品追加はログインなしでは行えない
- 会員はマイページからユーザ情報の閲覧・編集、注文履歴の閲覧、配送先の閲覧・編集ができる
- 商品は税込価格で表示される

店側実装機能
- 管理者用メールアドレスとパスワードでログインできる
- 商品の新規追加、編集、販売停止（売切表示）が行える
- 会員登録されているユーザ情報の閲覧、編集、退会処理が行える
- ユーザの注文履歴が一覧・詳細表示できる
- 注文履歴には注文ごとに下記の情報が表示される


## Gem
> refile
> refile-mini-magick
> bootstrap
> jquery
> kaminari
> device
> ransack
> paranoia
> enum_help


## Authors
チーム　3ヵ日
- 田所大
- 櫻井翔一郎
