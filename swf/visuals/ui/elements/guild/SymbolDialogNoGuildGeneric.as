package visuals.ui.elements.guild
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
   import visuals.ui.elements.backgrounds.SymbolSlice9BackgroundDialogGeneric;
   import visuals.ui.elements.tutorial.SymbolLadyBackGeneric;
   
   public class SymbolDialogNoGuildGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDialogNoGuild = null;
      
      public var dialogBackground:SymbolSlice9BackgroundDialogGeneric = null;
      
      public var txtMessage:ILabelArea = null;
      
      public var btnCreateGuild:SymbolUiButtonDefaultGeneric = null;
      
      public var btnFindGuild:SymbolUiButtonDefaultGeneric = null;
      
      public var txtTitle:ILabel = null;
      
      public var lady:SymbolLadyBackGeneric = null;
      
      public function SymbolDialogNoGuildGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDialogNoGuild;
         }
         else
         {
            _nativeObject = new SymbolDialogNoGuild();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         dialogBackground = new SymbolSlice9BackgroundDialogGeneric(_nativeObject.dialogBackground);
         txtMessage = FlashLabelArea.fromNative(_nativeObject.txtMessage);
         btnCreateGuild = new SymbolUiButtonDefaultGeneric(_nativeObject.btnCreateGuild);
         btnFindGuild = new SymbolUiButtonDefaultGeneric(_nativeObject.btnFindGuild);
         txtTitle = FlashLabel.fromNative(_nativeObject.txtTitle);
         lady = new SymbolLadyBackGeneric(_nativeObject.lady);
      }
      
      public function setNativeInstance(param1:SymbolDialogNoGuild) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.dialogBackground)
         {
            dialogBackground.setNativeInstance(_nativeObject.dialogBackground);
         }
         FlashLabelArea.setNativeInstance(txtMessage,_nativeObject.txtMessage);
         if(_nativeObject.btnCreateGuild)
         {
            btnCreateGuild.setNativeInstance(_nativeObject.btnCreateGuild);
         }
         if(_nativeObject.btnFindGuild)
         {
            btnFindGuild.setNativeInstance(_nativeObject.btnFindGuild);
         }
         FlashLabel.setNativeInstance(txtTitle,_nativeObject.txtTitle);
         if(_nativeObject.lady)
         {
            lady.setNativeInstance(_nativeObject.lady);
         }
      }
   }
}
