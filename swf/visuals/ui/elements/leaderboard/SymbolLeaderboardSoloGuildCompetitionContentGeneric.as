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
   
   public class SymbolLeaderboardSoloGuildCompetitionContentGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolLeaderboardSoloGuildCompetitionContent = null;
      
      public var line1:SymbolLeaderboardSoloGuildCompetitionLineGeneric = null;
      
      public var line2:SymbolLeaderboardSoloGuildCompetitionLineGeneric = null;
      
      public var line3:SymbolLeaderboardSoloGuildCompetitionLineGeneric = null;
      
      public var line4:SymbolLeaderboardSoloGuildCompetitionLineGeneric = null;
      
      public var line5:SymbolLeaderboardSoloGuildCompetitionLineGeneric = null;
      
      public var line6:SymbolLeaderboardSoloGuildCompetitionLineGeneric = null;
      
      public var line7:SymbolLeaderboardSoloGuildCompetitionLineGeneric = null;
      
      public var line8:SymbolLeaderboardSoloGuildCompetitionLineGeneric = null;
      
      public var line9:SymbolLeaderboardSoloGuildCompetitionLineGeneric = null;
      
      public var txtNoData:ILabelArea = null;
      
      public var txtPositionCaption:ILabel = null;
      
      public var txtPlayerCaption:ILabel = null;
      
      public var txtGuildCaption:ILabel = null;
      
      public var txtValueCaption:ILabel = null;
      
      public var txtScoreCaption:ILabel = null;
      
      public function SymbolLeaderboardSoloGuildCompetitionContentGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolLeaderboardSoloGuildCompetitionContent;
         }
         else
         {
            _nativeObject = new SymbolLeaderboardSoloGuildCompetitionContent();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         line1 = new SymbolLeaderboardSoloGuildCompetitionLineGeneric(_nativeObject.line1);
         line2 = new SymbolLeaderboardSoloGuildCompetitionLineGeneric(_nativeObject.line2);
         line3 = new SymbolLeaderboardSoloGuildCompetitionLineGeneric(_nativeObject.line3);
         line4 = new SymbolLeaderboardSoloGuildCompetitionLineGeneric(_nativeObject.line4);
         line5 = new SymbolLeaderboardSoloGuildCompetitionLineGeneric(_nativeObject.line5);
         line6 = new SymbolLeaderboardSoloGuildCompetitionLineGeneric(_nativeObject.line6);
         line7 = new SymbolLeaderboardSoloGuildCompetitionLineGeneric(_nativeObject.line7);
         line8 = new SymbolLeaderboardSoloGuildCompetitionLineGeneric(_nativeObject.line8);
         line9 = new SymbolLeaderboardSoloGuildCompetitionLineGeneric(_nativeObject.line9);
         txtNoData = FlashLabelArea.fromNative(_nativeObject.txtNoData);
         txtPositionCaption = FlashLabel.fromNative(_nativeObject.txtPositionCaption);
         txtPlayerCaption = FlashLabel.fromNative(_nativeObject.txtPlayerCaption);
         txtGuildCaption = FlashLabel.fromNative(_nativeObject.txtGuildCaption);
         txtValueCaption = FlashLabel.fromNative(_nativeObject.txtValueCaption);
         txtScoreCaption = FlashLabel.fromNative(_nativeObject.txtScoreCaption);
      }
      
      public function setNativeInstance(param1:SymbolLeaderboardSoloGuildCompetitionContent) : void
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
         FlashLabelArea.setNativeInstance(txtNoData,_nativeObject.txtNoData);
         FlashLabel.setNativeInstance(txtPositionCaption,_nativeObject.txtPositionCaption);
         FlashLabel.setNativeInstance(txtPlayerCaption,_nativeObject.txtPlayerCaption);
         FlashLabel.setNativeInstance(txtGuildCaption,_nativeObject.txtGuildCaption);
         FlashLabel.setNativeInstance(txtValueCaption,_nativeObject.txtValueCaption);
         FlashLabel.setNativeInstance(txtScoreCaption,_nativeObject.txtScoreCaption);
      }
   }
}
