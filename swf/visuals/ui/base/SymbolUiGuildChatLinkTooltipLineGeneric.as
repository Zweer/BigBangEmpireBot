package visuals.ui.base
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import flash.display.MovieClip;
   
   public class SymbolUiGuildChatLinkTooltipLineGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolUiGuildChatLinkTooltipLine = null;
      
      public var txtLink:ILabelArea = null;
      
      public var btnCharacter:SymbolIconButtonCharacterGeneric = null;
      
      public var btnGuild:SymbolIconButtonGuildGeneric = null;
      
      public var btnWhisper:SymbolIconButtonWhisperGuildMemberGeneric = null;
      
      public var btnURL:SymbolIconButtonOpenURLGeneric = null;
      
      public function SymbolUiGuildChatLinkTooltipLineGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolUiGuildChatLinkTooltipLine;
         }
         else
         {
            _nativeObject = new SymbolUiGuildChatLinkTooltipLine();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         txtLink = FlashLabelArea.fromNative(_nativeObject.txtLink);
         btnCharacter = new SymbolIconButtonCharacterGeneric(_nativeObject.btnCharacter);
         btnGuild = new SymbolIconButtonGuildGeneric(_nativeObject.btnGuild);
         btnWhisper = new SymbolIconButtonWhisperGuildMemberGeneric(_nativeObject.btnWhisper);
         btnURL = new SymbolIconButtonOpenURLGeneric(_nativeObject.btnURL);
      }
      
      public function setNativeInstance(param1:SymbolUiGuildChatLinkTooltipLine) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         FlashLabelArea.setNativeInstance(txtLink,_nativeObject.txtLink);
         if(_nativeObject.btnCharacter)
         {
            btnCharacter.setNativeInstance(_nativeObject.btnCharacter);
         }
         if(_nativeObject.btnGuild)
         {
            btnGuild.setNativeInstance(_nativeObject.btnGuild);
         }
         if(_nativeObject.btnWhisper)
         {
            btnWhisper.setNativeInstance(_nativeObject.btnWhisper);
         }
         if(_nativeObject.btnURL)
         {
            btnURL.setNativeInstance(_nativeObject.btnURL);
         }
      }
   }
}
