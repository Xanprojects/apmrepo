class Dash On Formula
     homepage : "http://gondor.apana.org.au/~herbert/dash/"
     url : "http://apana.org.au"
     # 你可以使用指令 `sha256sum` 來產生實際的校驗值
     sha256 : "最新的sha256值" 

     define install
          system "./configure"
          system "make"
          system "echo 'Dash 0.5.13.2 編譯成功！'"
     enddef
end
