package visuals.ui.elements.stream
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabel;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabel;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolPlaceholderGeneric;
   import visuals.ui.elements.backgrounds.SymbolSlice9BackgroundButtonGeneric;
   import visuals.ui.elements.backgrounds.SymbolSlice9BackgroundTooltipGeneric;
   
   public class SymbolPrivateConversationMemberMoreGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolPrivateConversationMemberMore = null;
      
      public var background:SymbolSlice9BackgroundButtonGeneric = null;
      
      public var txtMore:ILabel = null;
      
      public var memberBackground:SymbolSlice9BackgroundTooltipGeneric = null;
      
      public var members:SymbolPlaceholderGeneric = null;
      
      public function SymbolPrivateConversationMemberMoreGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolPrivateConversationMemberMore;
         }
         else
         {
            _nativeObject = new SymbolPrivateConversationMemberMore();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         background = new SymbolSlice9BackgroundButtonGeneric(_nativeObject.background);
         txtMore = FlashLabel.fromNative(_nativeObject.txtMore);
         memberBackground = new SymbolSlice9BackgroundTooltipGeneric(_nativeObject.memberBackground);
         members = new SymbolPlaceholderGeneric(_nativeObject.members);
      }
      
      public function setNativeInstance(param1:SymbolPrivateConversationMemberMore) : void
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
         FlashLabel.setNativeInstance(txtMore,_nativeObject.txtMore);
         if(_nativeObject.memberBackground)
         {
            memberBackground.setNativeInstance(_nativeObject.memberBackground);
         }
         if(_nativeObject.members)
         {
            members.setNativeInstance(_nativeObject.members);
         }
      }
   }
}
