package visuals.ui.elements.stream
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabel;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabel;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolUiButtonDefaultGeneric;
   
   public class SymbolServerSystemMessageGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolServerSystemMessage = null;
      
      public var background:SymbolPanelStreamElementBackgroundGeneric = null;
      
      public var txtSubject:ILabelArea = null;
      
      public var txtMessage:ILabelArea = null;
      
      public var txtDate:ILabel = null;
      
      public var btnGeneric:SymbolUiButtonDefaultGeneric = null;
      
      public function SymbolServerSystemMessageGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolServerSystemMessage;
         }
         else
         {
            _nativeObject = new SymbolServerSystemMessage();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         background = new SymbolPanelStreamElementBackgroundGeneric(_nativeObject.background);
         txtSubject = FlashLabelArea.fromNative(_nativeObject.txtSubject);
         txtMessage = FlashLabelArea.fromNative(_nativeObject.txtMessage);
         txtDate = FlashLabel.fromNative(_nativeObject.txtDate);
         btnGeneric = new SymbolUiButtonDefaultGeneric(_nativeObject.btnGeneric);
      }
      
      public function setNativeInstance(param1:SymbolServerSystemMessage) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.background)
         {
            background.setNativeInstance(_nativeObject.background);
         }
         FlashLabelArea.setNativeInstance(txtSubject,_nativeObject.txtSubject);
         FlashLabelArea.setNativeInstance(txtMessage,_nativeObject.txtMessage);
         FlashLabel.setNativeInstance(txtDate,_nativeObject.txtDate);
         if(_nativeObject.btnGeneric)
         {
            btnGeneric.setNativeInstance(_nativeObject.btnGeneric);
         }
      }
   }
}
