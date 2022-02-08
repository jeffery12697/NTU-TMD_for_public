import dj_database_url
from .settings import * 

DATABASES = {
    'default': dj_database_url.config(),
}
STATIC_ROOT = 'staticfiles' # 設定網站正式上線時靜態檔案目錄位置
SECURE_PROXY_SSL_HEADER = ('HTTP_X_FORWARDED_PROTO', 'https') # 設定HTTP連線方式


ALLOWED_HOSTS = ["*"]

CORS_ALLOWED_ORIGINS = [
    # "https://ntu-tmd2021.herokuapp.com"
]

DEBUG = False