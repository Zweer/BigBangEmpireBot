package visuals.ui.elements.guild
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabel;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabel;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolUiButtonDefaultGeneric;
   
   public class SymbolGuildLeaderVoteInfoGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolGuildLeaderVoteInfo = null;
      
      public var txtInfo:ILabel = null;
      
      public var txtEndTime:ILabel = null;
      
      public var btnVote:SymbolUiButtonDefaultGeneric = null;
      
      public function SymbolGuildLeaderVoteInfoGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolGuildLeaderVoteInfo;
         }
         else
         {
            _nativeObject = new SymbolGuildLeaderVoteInfo();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         txtInfo = FlashLabel.fromNative(_nativeObject.txtInfo);
         txtEndTime = FlashLabel.fromNative(_nativeObject.txtEndTime);
         btnVote = new SymbolUiButtonDefaultGeneric(_nativeObject.btnVote);
      }
      
      public function setNativeInstance(param1:SymbolGuildLeaderVoteInfo) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         FlashLabel.setNativeInstance(txtInfo,_nativeObject.txtInfo);
         FlashLabel.setNativeInstance(txtEndTime,_nativeObject.txtEndTime);
         if(_nativeObject.btnVote)
         {
            btnVote.setNativeInstance(_nativeObject.btnVote);
         }
      }
   }
}
