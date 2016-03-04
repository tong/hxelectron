
import js.Browser.console;
import js.Browser.document;
import js.Browser.window;
import js.Node.process;

class App {

    static function main() {
        window.onload = function(){
            var info = 'hxelectron - '+process.version+' - '+process.versions['electron'];
            console.info( info );
            document.getElementById( 'info' ).textContent = info;
            document.getElementById( 'logo' ).style.opacity = '1';
        }
    }
}
