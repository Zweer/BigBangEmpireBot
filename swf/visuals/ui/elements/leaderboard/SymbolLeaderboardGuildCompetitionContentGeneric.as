package visuals.ui.elements.leaderboard
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabel;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabel;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import flash.display.MovieClip;
   
   public class SymbolLeaderboardGuildCompetitionContentGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolLeaderboardGuildCompetitionContent = null;
      
      public var line1:SymbolLeaderboardGuildCompetitionLineGeneric = null;
      
      public var line2:SymbolLeaderboardGuildCompetitionLineGeneric = null;
      
      public var line3:SymbolLeaderboardGuildCompetitionLineGeneric = null;
      
      public var line4:SymbolLeaderboardGuildCompetitionLineGeneric = null;
      
      public var line5:SymbolLeaderboardGuildCompetitionLineGeneric = null;
      
      public var line6:SymbolLeaderboardGuildCompetitionLineGeneric = null;
      
      public var line7:SymbolLeaderboardGuildCompetitionLineGeneric = null;
      
      public var line8:SymbolLeaderboardGuildCompetitionLineGeneric = null;
      
      public var line9:SymbolLeaderboardGuildCompetitionLineGeneric = null;
      
      public var txtNoGuilds:ILabelArea = null;
      
      public var txtPositionCaption:ILabel = null;
      
      public var txtGuildCaption:ILabel = null;
      
      public var txtRewardCaption:ILabel = null;
      
      public var txtGuildCompetitionCaption:ILabel = null;
      
      public function SymbolLeaderboardGuildCompetitionContentGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolLeaderboardGuildCompetitionContent;
         }
         else
         {
            _nativeObject = new SymbolLeaderboardGuildCompetitionContent();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         line1 = new SymbolLeaderboardGuildCompetitionLineGeneric(_nativeObject.line1);
         line2 = new SymbolLeaderboardGuildCompetitionLineGeneric(_nativeObject.line2);
         line3 = new SymbolLeaderboardGuildCompetitionLineGeneric(_nativeObject.line3);
         line4 = new SymbolLeaderboardGuildCompetitionLineGeneric(_nativeObject.line4);
         line5 = new SymbolLeaderboardGuildCompetitionLineGeneric(_nativeObject.line5);
         line6 = new SymbolLeaderboardGuildCompetitionLineGeneric(_nativeObject.line6);
         line7 = new SymbolLeaderboardGuildCompetitionLineGeneric(_nativeObject.line7);
         line8 = new SymbolLeaderboardGuildCompetitionLineGeneric(_nativeObject.line8);
         line9 = new SymbolLeaderboardGuildCompetitionLineGeneric(_nativeObject.line9);
         txtNoGuilds = FlashLabelArea.fromNative(_nativeObject.txtNoGuilds);
         txtPositionCaption = FlashLabel.fromNative(_nativeObject.txtPositionCaption);
         txtGuildCaption = FlashLabel.fromNative(_nativeObject.txtGuildCaption);
         txtRewardCaption = FlashLabel.fromNative(_nativeObject.txtRewardCaption);
         txtGuildCompetitionCaption = FlashLabel.fromNative(_nativeObject.txtGuildCompetitionCaption);
      }
      
      public function setNativeInstance(param1:SymbolLeaderboardGuildCompetitionContent) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.line1)
         {
            line1.setNativeInstance(_nativeObject.line1);
         }
         if(_nativeObject.line2)
         {
            line2.setNativeInstance(_nativeObject.line2);
         }
         if(_nativeObject.line3)
         {
            line3.setNativeInstance(_nativeObject.line3);
         }
         if(_nativeObject.line4)
         {
            line4.setNativeInstance(_nativeObject.line4);
         }
         if(_nativeObject.line5)
         {
            line5.setNativeInstance(_nativeObject.line5);
         }
         if(_nativeObject.line6)
         {
            line6.setNativeInstance(_nativeObject.line6);
         }
         if(_nativeObject.line7)
         {
            line7.setNativeInstance(_nativeObject.line7);
         }
         if(_nativeObject.line8)
         {
            line8.setNativeInstance(_nativeObject.line8);
         }
         if(_nativeObject.line9)
         {
            line9.setNativeInstance(_nativeObject.line9);
         }
         FlashLabelArea.setNativeInstance(txtNoGuilds,_nativeObject.txtNoGuilds);
         FlashLabel.setNativeInstance(txtPositionCaption,_nativeObject.txtPositionCaption);
         FlashLabel.setNativeInstance(txtGuildCaption,_nativeObject.txtGuildCaption);
         FlashLabel.setNativeInstance(txtRewardCaption,_nativeObject.txtRewardCaption);
         FlashLabel.setNativeInstance(txtGuildCompetitionCaption,_nativeObject.txtGuildCompetitionCaption);
      }
   }
}
