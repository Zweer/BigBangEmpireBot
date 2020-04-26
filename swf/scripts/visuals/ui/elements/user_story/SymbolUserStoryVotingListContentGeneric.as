package visuals.ui.elements.user_story
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import flash.display.MovieClip;
   
   public class SymbolUserStoryVotingListContentGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolUserStoryVotingListContent = null;
      
      public var line1:SymbolUserStoryVotingListLineGeneric = null;
      
      public var line2:SymbolUserStoryVotingListLineGeneric = null;
      
      public var line3:SymbolUserStoryVotingListLineGeneric = null;
      
      public var line4:SymbolUserStoryVotingListLineGeneric = null;
      
      public var line5:SymbolUserStoryVotingListLineGeneric = null;
      
      public var line6:SymbolUserStoryVotingListLineGeneric = null;
      
      public var line7:SymbolUserStoryVotingListLineGeneric = null;
      
      public var line8:SymbolUserStoryVotingListLineGeneric = null;
      
      public var line9:SymbolUserStoryVotingListLineGeneric = null;
      
      public var line10:SymbolUserStoryVotingListLineGeneric = null;
      
      public var txtCaptionTitle:ILabelArea = null;
      
      public var txtCaptionStage:ILabelArea = null;
      
      public var txtCaptionDate:ILabelArea = null;
      
      public var txtCaptionTag:ILabelArea = null;
      
      public var txtNoUserStories:ILabelArea = null;
      
      public function SymbolUserStoryVotingListContentGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolUserStoryVotingListContent;
         }
         else
         {
            _nativeObject = new SymbolUserStoryVotingListContent();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         line1 = new SymbolUserStoryVotingListLineGeneric(_nativeObject.line1);
         line2 = new SymbolUserStoryVotingListLineGeneric(_nativeObject.line2);
         line3 = new SymbolUserStoryVotingListLineGeneric(_nativeObject.line3);
         line4 = new SymbolUserStoryVotingListLineGeneric(_nativeObject.line4);
         line5 = new SymbolUserStoryVotingListLineGeneric(_nativeObject.line5);
         line6 = new SymbolUserStoryVotingListLineGeneric(_nativeObject.line6);
         line7 = new SymbolUserStoryVotingListLineGeneric(_nativeObject.line7);
         line8 = new SymbolUserStoryVotingListLineGeneric(_nativeObject.line8);
         line9 = new SymbolUserStoryVotingListLineGeneric(_nativeObject.line9);
         line10 = new SymbolUserStoryVotingListLineGeneric(_nativeObject.line10);
         txtCaptionTitle = FlashLabelArea.fromNative(_nativeObject.txtCaptionTitle);
         txtCaptionStage = FlashLabelArea.fromNative(_nativeObject.txtCaptionStage);
         txtCaptionDate = FlashLabelArea.fromNative(_nativeObject.txtCaptionDate);
         txtCaptionTag = FlashLabelArea.fromNative(_nativeObject.txtCaptionTag);
         txtNoUserStories = FlashLabelArea.fromNative(_nativeObject.txtNoUserStories);
      }
      
      public function setNativeInstance(param1:SymbolUserStoryVotingListContent) : void
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
         if(_nativeObject.line10)
         {
            line10.setNativeInstance(_nativeObject.line10);
         }
         FlashLabelArea.setNativeInstance(txtCaptionTitle,_nativeObject.txtCaptionTitle);
         FlashLabelArea.setNativeInstance(txtCaptionStage,_nativeObject.txtCaptionStage);
         FlashLabelArea.setNativeInstance(txtCaptionDate,_nativeObject.txtCaptionDate);
         FlashLabelArea.setNativeInstance(txtCaptionTag,_nativeObject.txtCaptionTag);
         FlashLabelArea.setNativeInstance(txtNoUserStories,_nativeObject.txtNoUserStories);
      }
   }
}
