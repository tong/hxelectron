
import js.Browser.console;
import js.Browser.document;
import js.Browser.window;
import js.Node.process;
import js.node.ChildProcess;

class App {

    static inline function setText( id : String, text : String ) {
        document.getElementById( id ).textContent = text;
    }

    static function main() {

        js.Browser.window.onload = function() {

            document.getElementById( 'logo-haxe' ).style.opacity = '1';

            setText( 'system-version', process.platform +' '+ process.arch );
            setText( 'node-version', 'node '+process.version );
            setText( 'electron-version', 'electron '+process.versions['electron'] );

            ChildProcess.spawn( 'haxe', ['-version'] ).stdout.on( 'data', function(buf) {
				var version = buf.toString();
                setText( 'haxe-version', 'haxe $version' );
            });

            //electron.remote.Dialog.showOpenDialog({ properties: ['openFile', 'multiSelections'] });
            //trace(electron.remote.Dialog);
            //trace(js.Lib.require("electron"));
            trace(electron.renderer.Remote);
            //trace(electron.remote.Menu);

            var menu = new electron.remote.Menu();
			menu.append(new electron.remote.MenuItem({ label: 'MenuItem11111111'} ) );
			electron.remote.Menu.setApplicationMenu(menu);


            /* var menu = new electron.remote.Menu();
			menu.append(new electron.remote.MenuItem({ label: 'MenuItem1'} ) );
			electron.remote.Menu.setApplicationMenu(menu);
            //menu.popup({ window: electron.renderer.Remote.getCurrentWindow() });
            js.Lib.require("electron.remote.menu"); */
        }
    }

}
