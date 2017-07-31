# ulima

## 社内向けフリマアプリ　ulima
使わなくなった物を社内で欲しい人に譲りましょう。

### 使い方
* サーバの環境変数に「メールサーバ」「cloudinary」「利用する組織のメールドメイン」の設定が必要です。利用するサーバの環境変数にそれぞれを設定してください。
  * export MAIL_SERVER_NAME="メールサーバのアドレス" #アカウント認証や購入の通知などに使用します。
  * export MAIL_SERVER_PASSWORD="メールサーバのパスワード"　
  * export CLOUDINARY_NAME="cloudinaryのCloud Name"
  * export CLOUDINARY_API_KEY="cloudinaryのAPI Key"
  * export CLOUDINARY_API_SECRET="cloudinaryのAPI Secret"
  * export COMMUNITY_EMAIL_DMAIN="コミュニティのメールドメイン（@以下）"

### 基本機能
* アカウントを作成し、品物を出品。
* 出品されているものを購入。

### 追加機能
* 出品されている品物にコメント。
* 出品されている品物をお気に入り登録。
* オークション形式の取引を選択できる。

### 決済方法
出品者のデスクに行って手渡し。

### 発送方法
購入者にデスクまで取りに来てもらう。

