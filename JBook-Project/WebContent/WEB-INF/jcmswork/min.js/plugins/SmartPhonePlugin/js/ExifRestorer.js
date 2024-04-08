var ExifRestorer=(function(){var a={};a.KEY_STR="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=";a.encode64=function(d){var b="",l,j,g="",k,h,f,e="",c=0;do{l=d[c++];j=d[c++];g=d[c++];k=l>>2;h=((l&3)<<4)|(j>>4);f=((j&15)<<2)|(g>>6);e=g&63;if(isNaN(j)){f=e=64}else{if(isNaN(g)){e=64}}b=b+this.KEY_STR.charAt(k)+this.KEY_STR.charAt(h)+this.KEY_STR.charAt(f)+this.KEY_STR.charAt(e);l=j=g="";k=h=f=e=""}while(c<d.length);return b};a.restore=function(b,f){if(!b.match("data:image/jpeg;base64,")){return f}var e=this.decode64(b.replace("data:image/jpeg;base64,",""));var c=this.slice2Segments(e);var d=this.exifManipulation(f,c);return this.encode64(d)};a.exifManipulation=function(f,d){var b=this.getExifArray(d),c=this.insertExif(f,b),e=new Uint8Array(c);return e};a.getExifArray=function(d){var c;for(var b=0;b<d.length;b++){c=d[b];if((c[0]==255)&(c[1]==225)){return c}}return[]};a.insertExif=function(i,b){var h=i.replace("data:image/jpeg;base64,",""),d=this.decode64(h),c=d.indexOf(255,3),f=d.slice(0,c),e=d.slice(c),g=f;g=g.concat(b);g=g.concat(e);return g};a.slice2Segments=function(c){var f=0,d=[];while(1){if((c[f]==255)&(c[f+1]==218)){break}if((c[f]==255)&(c[f+1]==216)){f+=2}else{var g=c[f+2]*256+c[f+3],e=f+g+2,b=c.slice(f,e);d.push(b);f=e}if(f>c.length){break}}return d};a.decode64=function(f){var d="",n,l,j="",m,k,h,g="",e=0,c=[];var b=/[^A-Za-z0-9\+\/\=]/g;if(b.exec(f)){alert("There were invalid base64 characters in the input text.\nValid base64 characters are A-Z, a-z, 0-9, '+', '/',and '='\nExpect errors in decoding.")}f=f.replace(/[^A-Za-z0-9\+\/\=]/g,"");do{m=this.KEY_STR.indexOf(f.charAt(e++));k=this.KEY_STR.indexOf(f.charAt(e++));h=this.KEY_STR.indexOf(f.charAt(e++));g=this.KEY_STR.indexOf(f.charAt(e++));n=(m<<2)|(k>>4);l=((k&15)<<4)|(h>>2);j=((h&3)<<6)|g;c.push(n);if(h!=64){c.push(l)}if(g!=64){c.push(j)}n=l=j="";m=k=h=g=""}while(e<f.length);return c};return a})();