package test.webview;


import android.content.Context;
import android.net.http.SslError;
import android.os.Build;
import android.os.Bundle;
import android.view.View;
import android.webkit.JavascriptInterface;
import android.webkit.PermissionRequest;
import android.webkit.SslErrorHandler;
import android.webkit.WebChromeClient;
import android.webkit.WebSettings;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.widget.Toast;

import androidx.appcompat.app.AppCompatActivity;

import test.webview.databinding.ActivityMainBinding;

public class MainActivity extends AppCompatActivity {
    private WebView mWebView; // 웹뷰 선언
    private WebSettings mWebSettings; //웹뷰세팅

    private ActivityMainBinding mBinding;



    public class JavaScriptInterface {
        Context mContext;

        JavaScriptInterface(Context c) {
            mContext = c;
        }

        @JavascriptInterface
        public int showInfoFromJs2(String toast) {
            Toast.makeText(mContext, toast, Toast.LENGTH_SHORT).show();

            return 99;
        }
        @JavascriptInterface
        public void showInfoFromJs(String toast) {
            Toast.makeText(mContext, toast, Toast.LENGTH_SHORT).show();
        }
    }


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
//        setContentView(R.layout.activity_main);
        mBinding = ActivityMainBinding.inflate(getLayoutInflater());

        View view = mBinding.getRoot();
        setContentView(view);


        mBinding.btn1.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Toast.makeText(getApplicationContext(), "btton1 click", Toast.LENGTH_SHORT).show();
                mWebView.loadUrl("javascript:callJs('Hello from Android')"); // 웹뷰에 표시할 웹사이트 주소, 웹뷰 시작
            }
        });

        mBinding.btn2.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Toast.makeText(getApplicationContext(), "btton2 click", Toast.LENGTH_SHORT).show();
            }
        });


// ssl 인증서 생성
// $ mkcert example.com "*.example.com" example.test localhost 192.168.0.7 127.0.0.1 ::1


//        String url = "http://192.168.0.77:8080";
        String url = "http://61.75.81.45:20181";
//        String url = "https://www.naver.com";

        // 웹뷰 시작
        mWebView = (WebView) findViewById(R.id.webView);

        mWebView.setWebViewClient(new WebViewClient() {
              @Override
              public void onReceivedSslError(WebView view, SslErrorHandler handler, SslError error) {
                  handler.proceed();
              }
        }); // 클릭시 새창 안뜨게 & ssl error시 화면 하얗게 나오는 부분을 그냥 진행하도록

//        mWebView.setWebViewClient(new SslWebViewConnect());


        mWebView.setWebChromeClient(new WebChromeClient(){
            @Override
            public void onPermissionRequest(PermissionRequest request) {
                runOnUiThread(() -> {
                    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
                        String[] PERMISSIONS = {
//                                PermissionRequest.RESOURCE_AUDIO_CAPTURE,
                                PermissionRequest.RESOURCE_VIDEO_CAPTURE
                        };
                        request.grant(PERMISSIONS);
                    }
                });
            }
        });  // webview에 permission부여하기

        mWebView.getSettings().setMediaPlaybackRequiresUserGesture(false);

        mWebView.clearCache(true);
        mWebView.getSettings().setCacheMode(WebSettings.LOAD_CACHE_ELSE_NETWORK);

        mWebSettings = mWebView.getSettings(); //세부 세팅 등록
        mWebSettings.setJavaScriptEnabled(true); // 웹페이지 자바스클비트 허용 여부
        mWebSettings.setSupportMultipleWindows(false); // 새창 띄우기 허용 여부
        mWebSettings.setJavaScriptCanOpenWindowsAutomatically(false); // 자바스크립트 새창 띄우기(멀티뷰) 허용 여부
        mWebSettings.setLoadWithOverviewMode(true); // 메타태그 허용 여부
        mWebSettings.setUseWideViewPort(true); // 화면 사이즈 맞추기 허용 여부
        mWebSettings.setSupportZoom(false); // 화면 줌 허용 여부
        mWebSettings.setBuiltInZoomControls(false); // 화면 확대 축소 허용 여부
        mWebSettings.setLayoutAlgorithm(WebSettings.LayoutAlgorithm.SINGLE_COLUMN); // 컨텐츠 사이즈 맞추기
        mWebSettings.setCacheMode(WebSettings.LOAD_NO_CACHE); // 브라우저 캐시 허용 여부
        mWebSettings.setDomStorageEnabled(true); // 로컬저장소 허용 여부

        mWebView.addJavascriptInterface(new JavaScriptInterface(this), "androidinfo");

        mWebView.loadUrl(url); // 웹뷰에 표시할 웹사이트 주소, 웹뷰 시작
    }


    @Override
    public void onBackPressed() {
        if(mWebView.canGoBack()) {
            mWebView.goBack();
        } else {
            super.onBackPressed();
        }
    }

}
