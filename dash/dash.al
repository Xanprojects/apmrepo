class Dash On Formula
     homepage : "http://gondor.apana.org.au/~herbert/dash/"
     url : "http://apana.org.au"
     # 你可以使用指令 `sha256sum` 來產生實際的校驗值
     sha256 : "6a474ac46e8b0b32916c4c60df694c82058d3297d8b385b74508030ca4a8f28a" 

     define install
          system "./configure"
          system "make"
          system "echo 'Dash編譯成功！'"
     enddef
end
