package com.playata.application.ui.dialogs
{
   import com.playata.application.AppConfig;
   import com.playata.application.assets.AppAssetUtil;
   import com.playata.application.data.GameUtil;
   import com.playata.application.data.constants.CConstant;
   import com.playata.application.data.user.User;
   import com.playata.application.data.user_story.UserStory;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.button.UiPremiumButton;
   import com.playata.application.ui.elements.generic.button.UiTextButton;
   import com.playata.application.ui.elements.generic.dialog.UiDialog;
   import com.playata.application.ui.elements.generic.dialog.UiInfoDialog;
   import com.playata.application.ui.elements.generic.scrollbar.UiScrollBar;
   import com.playata.application.ui.elements.generic.tab.UiTabButton;
   import com.playata.application.ui.elements.generic.textfield.UiTextTooltip;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.core.util.StringUtil;
   import com.playata.framework.core.util.TimeUtil;
   import com.playata.framework.display.ui.controls.ILabel;
   import com.playata.framework.display.ui.controls.ITextInput;
   import com.playata.framework.display.ui.dialogs.Dialog;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.dialogs.SymbolDialogUserStoryWriteGeneric;
   
   public class DialogUserStoryWrite extends UiDialog
   {
       
      
      private var _btnClose:UiButton = null;
      
      private var _btnTabBriefing:UiTabButton = null;
      
      private var _btnTabOutro:UiTabButton = null;
      
      private var _btnSave:UiPremiumButton = null;
      
      private var _btnPreview:UiTextButton = null;
      
      private var _btnSelectLocaleLeft:UiButton = null;
      
      private var _btnSelectLocaleRight:UiButton = null;
      
      private var _btnSelectStageLeft:UiButton = null;
      
      private var _btnSelectStageRight:UiButton = null;
      
      private var _btnSelectTagLeft:UiButton = null;
      
      private var _btnSelectTagRight:UiButton = null;
      
      private var _tagTooltip:UiTextTooltip = null;
      
      private var _availableLocales:Vector.<String> = null;
      
      private var _availableStages:Vector.<int> = null;
      
      private var _scrollBarBriefing:UiScrollBar = null;
      
      private var _scrollBarOutro:UiScrollBar = null;
      
      private var _userStory:UserStory = null;
      
      private var _maxSpendablePremiumCurrency:int = -1;
      
      private var _currentLocale:String = null;
      
      private var _currentTag:int = 0;
      
      private var _currentStage:int = 0;
      
      public function DialogUserStoryWrite(param1:UserStory)
      {
         var _loc2_:SymbolDialogUserStoryWriteGeneric = new SymbolDialogUserStoryWriteGeneric();
         super(_loc2_);
         _queued = false;
         _userStory = param1;
         _btnTabBriefing = new UiTabButton(_loc2_.btnTabBriefing,LocText.current.text("dialog/user_story_read/btn_tab_briefing"),"",onClickTabBriefing);
         _btnTabBriefing.tabbed = false;
         _btnTabOutro = new UiTabButton(_loc2_.btnTabOutro,LocText.current.text("dialog/user_story_read/btn_tab_outro"),"",onClickTabOutro);
         _btnTabOutro.tabbed = false;
         _btnClose = new UiButton(_loc2_.btnClose,"",onClickClose);
         _btnSave = new UiPremiumButton(_loc2_.btnSave,CConstant.user_story_creation_cost,LocText.current.text("dialog/user_story_write/btn_edit"),LocText.current.text("dialog/user_story_write/btn_create"),"","",onClickSave);
         _btnSave.premium = _userStory == null;
         _btnPreview = new UiTextButton(_loc2_.btnPreview,LocText.current.text("dialog/user_story_write/btn_preview"),"",onClickPreview);
         _btnSelectLocaleLeft = new UiButton(_loc2_.btnSelectLocaleLeft,"",onClickLocaleLeft);
         _btnSelectLocaleRight = new UiButton(_loc2_.btnSelectLocaleRight,"",onClickLocaleRight);
         _btnSelectStageLeft = new UiButton(_loc2_.btnSelectStageLeft,"",onClickStageLeft);
         _btnSelectStageRight = new UiButton(_loc2_.btnSelectStageRight,"",onClickStageRight);
         _btnSelectTagLeft = new UiButton(_loc2_.btnSelectTagLeft,"",onClickTagLeft);
         _btnSelectTagRight = new UiButton(_loc2_.btnSelectTagRight,"",onClickTagRight);
         _tagTooltip = new UiTextTooltip(_loc2_.tagTooltipLayer,"");
         if(_btnSave.premium)
         {
            _loc2_.txtDialogTitle.text = LocText.current.text("dialog/user_story_write/title");
         }
         else
         {
            _loc2_.txtDialogTitle.text = LocText.current.text("dialog/user_story_write/title_edit");
         }
         _loc2_.txtCaptionTitle.text = LocText.current.text("dialog/user_story_read/caption_title");
         _availableLocales = AppConfig.userStoryLocales;
         setLocale(User.current.character.locale);
         setTag(7);
         _loc2_.txtStageName.autoFontSize = true;
         _availableStages = GameUtil.getCharacterStages(User.current.character);
         _availableStages.insertAt(0,0);
         setStage(User.current.character.currentQuestStage);
         _loc2_.iconExclamationMarkBriefing.nativeInstance.mouseChildren = false;
         _loc2_.iconExclamationMarkOutro.nativeInstance.mouseChildren = false;
         _loc2_.iconExclamationMarkBriefing.applySettings(new TypedObject({"interactionEnabled":false}));
         _loc2_.iconExclamationMarkOutro.applySettings(new TypedObject({"interactionEnabled":false}));
         _loc2_.txtInputTitle.onChange.add(onInputChanged);
         _loc2_.txtInputBriefing.onChange.add(onInputChanged);
         _loc2_.txtInputOutro.onChange.add(onInputChanged);
         if(_userStory)
         {
            _loc2_.txtInputTitle.text = _userStory.title;
            _loc2_.txtInputBriefing.text = _userStory.briefing;
            _loc2_.txtInputOutro.text = _userStory.outro;
            setLocale(_userStory.locale);
            setTag(_userStory.tag);
            setStage(_userStory.stage);
         }
         else
         {
            _loc2_.txtInputTitle.text = "";
            _loc2_.txtInputBriefing.text = "";
            _loc2_.txtInputOutro.text = "";
         }
         onInputChanged(_loc2_.txtInputTitle);
         _scrollBarBriefing = new UiScrollBar(_loc2_.scrollBarKnobBriefing,_loc2_.scrollBarLineBriefing,_loc2_.txtInputBriefing);
         _loc2_.txtInputBriefing.verticalScrollBar = _scrollBarBriefing;
         _scrollBarBriefing.refresh();
         _scrollBarOutro = new UiScrollBar(_loc2_.scrollBarKnobOutro,_loc2_.scrollBarLineOutro,_loc2_.txtInputOutro);
         _loc2_.txtInputOutro.verticalScrollBar = _scrollBarOutro;
         _scrollBarOutro.refresh();
         onClickTabBriefing(null);
         _tabObjects.push(_loc2_.txtInputTitle);
         _tabObjects.push(_loc2_.txtInputBriefing);
         _tabObjects.push(_loc2_.txtInputOutro);
         Dialog.focus = _loc2_.txtInputTitle;
         if(_btnSave.premium)
         {
            Environment.application.sendActionRequest("getCharacterMaxSpendableAmount",{},handleRequests);
         }
      }
      
      override public function dispose() : void
      {
         _btnTabBriefing.dispose();
         _btnTabBriefing = null;
         _btnTabOutro.dispose();
         _btnTabOutro = null;
         _btnClose.dispose();
         _btnClose = null;
         _scrollBarBriefing.dispose();
         _scrollBarBriefing = null;
         _scrollBarOutro.dispose();
         _scrollBarOutro = null;
         _btnPreview.dispose();
         _btnPreview = null;
         _btnSelectLocaleLeft.dispose();
         _btnSelectLocaleLeft = null;
         _btnSelectLocaleRight.dispose();
         _btnSelectLocaleRight = null;
         _btnSelectStageLeft.dispose();
         _btnSelectStageLeft = null;
         _btnSelectStageRight.dispose();
         _btnSelectStageRight = null;
         _btnSelectTagLeft.dispose();
         _btnSelectTagLeft = null;
         _btnSelectTagRight.dispose();
         _btnSelectTagRight = null;
         _tagTooltip.dispose();
         _tagTooltip = null;
         _userStory = null;
         super.dispose();
      }
      
      private function onInputChanged(param1:ITextInput) : void
      {
         var _loc4_:SymbolDialogUserStoryWriteGeneric = _vo as SymbolDialogUserStoryWriteGeneric;
         var _loc3_:int = StringUtil.trim(param1.text).length;
         var _loc2_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:ILabel = null;
         var _loc7_:* = param1;
         switch(_loc7_)
         {
            case _loc4_.txtInputTitle:
               _loc2_ = CConstant.user_story_max_title_char_count;
               _loc5_ = CConstant.user_story_min_title_char_count;
               _loc6_ = _loc4_.txtTitleCharCountInfo;
               break;
            case _loc4_.txtInputBriefing:
               _loc2_ = CConstant.user_story_max_briefing_char_count;
               _loc5_ = CConstant.user_story_min_briefing_char_count;
               _loc6_ = _loc4_.txtMessageCharCountInfo;
               break;
            case _loc4_.txtInputOutro:
               _loc2_ = CConstant.user_story_max_outro_char_count;
               _loc5_ = CConstant.user_story_min_outro_char_count;
               _loc6_ = _loc4_.txtMessageCharCountInfo;
         }
         if(_loc3_ < _loc5_)
         {
            _loc6_.text = LocText.current.text("dialog/user_story_write/char_count_min",_loc3_,_loc5_);
         }
         else
         {
            _loc6_.text = LocText.current.text("dialog/user_story_write/char_count_max",_loc3_,_loc2_);
         }
         _loc6_.textColor = _loc3_ < _loc5_ || _loc3_ > _loc2_?16711680:16777215;
      }
      
      private function onClickTabBriefing(param1:InteractionEvent = null) : void
      {
         if(_btnTabBriefing.tabbed)
         {
            return;
         }
         var _loc2_:SymbolDialogUserStoryWriteGeneric = _vo as SymbolDialogUserStoryWriteGeneric;
         _btnTabBriefing.tabbed = true;
         _btnTabOutro.tabbed = false;
         _loc2_.txtInputBriefing.visible = true;
         _loc2_.txtInputOutro.visible = false;
         _loc2_.iconExclamationMarkBriefing.visible = false;
         _loc2_.iconExclamationMarkOutro.visible = _loc2_.txtInputOutro.text.length < CConstant.user_story_min_outro_char_count || _loc2_.txtInputOutro.text.length > CConstant.user_story_max_outro_char_count;
         _scrollBarBriefing.visible = true;
         _scrollBarBriefing.refresh();
         _scrollBarOutro.visible = false;
         Dialog.focus = _loc2_.txtInputBriefing;
         onInputChanged(_loc2_.txtInputBriefing);
      }
      
      private function onClickTabOutro(param1:InteractionEvent = null) : void
      {
         if(_btnTabOutro.tabbed)
         {
            return;
         }
         var _loc2_:SymbolDialogUserStoryWriteGeneric = _vo as SymbolDialogUserStoryWriteGeneric;
         _btnTabBriefing.tabbed = false;
         _btnTabOutro.tabbed = true;
         _loc2_.txtInputBriefing.visible = false;
         _loc2_.txtInputOutro.visible = true;
         _loc2_.iconExclamationMarkBriefing.visible = _loc2_.txtInputBriefing.text.length < CConstant.user_story_min_briefing_char_count || _loc2_.txtInputBriefing.text.length > CConstant.user_story_max_briefing_char_count;
         _loc2_.iconExclamationMarkOutro.visible = false;
         _scrollBarBriefing.visible = false;
         _scrollBarOutro.visible = true;
         _scrollBarOutro.refresh();
         Dialog.focus = _loc2_.txtInputOutro;
         onInputChanged(_loc2_.txtInputOutro);
      }
      
      private function onClickSave(param1:InteractionEvent) : void
      {
         var _loc2_:* = null;
         var _loc3_:SymbolDialogUserStoryWriteGeneric = _vo as SymbolDialogUserStoryWriteGeneric;
         if(_btnSave.premium && _maxSpendablePremiumCurrency >= 0 && _btnSave.premiumAmount > _maxSpendablePremiumCurrency)
         {
            ViewManager.instance.showNotEnoughPremiumDialog(_btnSave.premiumAmount,true);
            return;
         }
         if(StringUtil.trim(_loc3_.txtInputTitle.text).length < CConstant.user_story_min_title_char_count)
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("general/info"),LocText.current.text("error/dialog/user_story_write/title_to_short",CConstant.user_story_min_title_char_count),LocText.current.text("general/button_ok")));
         }
         else if(StringUtil.trim(_loc3_.txtInputTitle.text).length > CConstant.user_story_max_title_char_count)
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("general/info"),LocText.current.text("error/dialog/user_story_write/title_to_long",CConstant.user_story_max_title_char_count),LocText.current.text("general/button_ok")));
         }
         else if(StringUtil.trim(_loc3_.txtInputBriefing.text).length < CConstant.user_story_min_briefing_char_count)
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("general/info"),LocText.current.text("error/dialog/user_story_write/briefing_to_short",CConstant.user_story_min_briefing_char_count),LocText.current.text("general/button_ok"),onClickTabBriefing));
         }
         else if(StringUtil.trim(_loc3_.txtInputBriefing.text).length > CConstant.user_story_max_briefing_char_count)
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("general/info"),LocText.current.text("error/dialog/user_story_write/briefing_to_long",CConstant.user_story_max_briefing_char_count),LocText.current.text("general/button_ok"),onClickTabBriefing));
         }
         else if(StringUtil.trim(_loc3_.txtInputOutro.text).length < CConstant.user_story_min_outro_char_count)
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("general/info"),LocText.current.text("error/dialog/user_story_write/outro_to_short",CConstant.user_story_min_outro_char_count),LocText.current.text("general/button_ok"),onClickTabOutro));
         }
         else if(StringUtil.trim(_loc3_.txtInputOutro.text).length > CConstant.user_story_max_outro_char_count)
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("general/info"),LocText.current.text("error/dialog/user_story_write/outro_to_long",CConstant.user_story_max_outro_char_count),LocText.current.text("general/button_ok"),onClickTabOutro));
         }
         else
         {
            _loc2_ = {};
            _loc2_.stage = _currentStage;
            _loc2_.tag = _currentTag;
            _loc2_.locale = _currentLocale;
            _loc2_.title = _loc3_.txtInputTitle.text;
            _loc2_.briefing = _loc3_.txtInputBriefing.text;
            _loc2_.outro = _loc3_.txtInputOutro.text;
            if(_btnSave.premium)
            {
               Environment.panelManager.showDialog(new DialogUserStoryWriteConfirm(onSave));
            }
            else
            {
               onSave();
            }
         }
      }
      
      private function onSave() : void
      {
         var _loc2_:SymbolDialogUserStoryWriteGeneric = _vo as SymbolDialogUserStoryWriteGeneric;
         var _loc1_:Object = {};
         _loc1_.stage = _currentStage;
         _loc1_.tag = _currentTag;
         _loc1_.locale = _currentLocale;
         _loc1_.title = _loc2_.txtInputTitle.text;
         _loc1_.briefing = _loc2_.txtInputBriefing.text;
         _loc1_.outro = _loc2_.txtInputOutro.text;
         if(_btnSave.premium)
         {
            Environment.application.sendActionRequest("createUserStory",_loc1_,handleRequests);
         }
         else
         {
            if(_loc1_.stage == _userStory.stage && _loc1_.tag == _userStory.tag && _loc1_.locale == _userStory.locale && _loc1_.title == _userStory.title && _loc1_.briefing == _userStory.briefing && _loc1_.outro == _userStory.outro)
            {
               close();
               return;
            }
            _loc1_.user_story_id = _userStory.id;
            Environment.application.sendActionRequest("editUserStory",_loc1_,handleRequests);
         }
      }
      
      private function onClickPreview(param1:InteractionEvent) : void
      {
         var _loc2_:SymbolDialogUserStoryWriteGeneric = _vo as SymbolDialogUserStoryWriteGeneric;
         var _loc3_:UserStory = new UserStory(null);
         _loc3_.setString("title",_loc2_.txtInputTitle.text);
         _loc3_.setString("briefing",_loc2_.txtInputBriefing.text);
         _loc3_.setString("outro",_loc2_.txtInputOutro.text);
         _loc3_.setString("locale",_currentLocale);
         _loc3_.setInt("tag",_currentTag);
         _loc3_.setInt("stage",_currentStage);
         _loc3_.setInt("status",1);
         _loc3_.setInt("ts_creation",TimeUtil.now);
         _loc3_.setInt("id",0);
         Environment.panelManager.showDialog(new DialogUserStoryRead(_loc3_,null));
      }
      
      private function onClickLocaleLeft(param1:InteractionEvent) : void
      {
         var _loc2_:int = _availableLocales.indexOf(_currentLocale);
         _loc2_--;
         if(_loc2_ < 0)
         {
            _loc2_ = _availableLocales.length - 1;
         }
         setLocale(_availableLocales[_loc2_]);
      }
      
      private function onClickLocaleRight(param1:InteractionEvent) : void
      {
         var _loc2_:int = _availableLocales.indexOf(_currentLocale);
         _loc2_++;
         if(_loc2_ >= _availableLocales.length)
         {
            _loc2_ = 0;
         }
         setLocale(_availableLocales[_loc2_]);
      }
      
      private function onClickStageLeft(param1:InteractionEvent) : void
      {
         var _loc2_:int = _availableStages.indexOf(_currentStage);
         _loc2_--;
         if(_loc2_ < 0)
         {
            _loc2_ = _availableStages.length - 1;
         }
         setStage(_availableStages[_loc2_]);
      }
      
      private function onClickStageRight(param1:InteractionEvent) : void
      {
         var _loc2_:int = _availableStages.indexOf(_currentStage);
         _loc2_++;
         if(_loc2_ >= _availableStages.length)
         {
            _loc2_ = 0;
         }
         setStage(_availableStages[_loc2_]);
      }
      
      private function onClickTagLeft(param1:InteractionEvent) : void
      {
         var _loc2_:int = _currentTag;
         _loc2_--;
         if(_loc2_ < 1)
         {
            _loc2_ = 7;
         }
         setTag(_loc2_);
      }
      
      private function onClickTagRight(param1:InteractionEvent) : void
      {
         var _loc2_:int = _currentTag;
         _loc2_++;
         if(_loc2_ > 7)
         {
            _loc2_ = 1;
         }
         setTag(_loc2_);
      }
      
      private function setLocale(param1:String) : void
      {
         var _loc2_:SymbolDialogUserStoryWriteGeneric = _vo as SymbolDialogUserStoryWriteGeneric;
         if(_availableLocales.indexOf(param1) < 0)
         {
            param1 = "en_GB";
         }
         _currentLocale = param1;
         _loc2_.iconLocale.gotoAndStop(AppAssetUtil.getLocaleFlagIndex(_currentLocale));
      }
      
      private function setTag(param1:int) : void
      {
         var _loc2_:SymbolDialogUserStoryWriteGeneric = _vo as SymbolDialogUserStoryWriteGeneric;
         _currentTag = param1;
         _loc2_.iconTag.gotoAndStop(_currentTag);
         _tagTooltip.text = LocText.current.text("dialog/user_story/tag_" + _currentTag + "/tooltip");
      }
      
      private function setStage(param1:int) : void
      {
         var _loc2_:SymbolDialogUserStoryWriteGeneric = _vo as SymbolDialogUserStoryWriteGeneric;
         _currentStage = param1;
         if(_currentStage == 0)
         {
            _loc2_.txtStageName.text = LocText.current.text("dialog/user_story/all_stages");
         }
         else
         {
            _loc2_.txtStageName.text = LocText.current.text("dialog/stage_unlocked/stage" + _currentStage + "_title");
         }
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc2_:* = param1.action;
         switch(_loc2_)
         {
            case "getCharacterMaxSpendableAmount":
               if(param1.error == "")
               {
                  Environment.application.updateData(param1.data);
                  _maxSpendablePremiumCurrency = param1.appResponse.max_spendable_amount;
               }
               break;
            case "createUserStory":
               if(param1.error == "")
               {
                  Environment.application.updateData(param1.data);
                  if(Environment.panelManager.dialogManager.hasVisibleDialog(DialogUserStory))
                  {
                     (Environment.panelManager.dialogManager.getVisibleDialog(DialogUserStory) as DialogUserStory).refreshActiveUserStory();
                  }
                  Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/user_story_created/title"),LocText.current.text("dialog/user_story_created/text"),LocText.current.text("general/button_ok")));
                  close();
               }
               else if(param1.error == "errCreateUserStoryUserNoPayUser" || param1.error == "errCreateUserStoryLimitReached" || param1.error == "errRemovePremiumCurrencyNotEnough")
               {
                  ViewManager.instance.showNotEnoughPremiumDialog(_btnSave.premiumAmount,true);
               }
               else if(param1.error == "errCreateUserStoryLocked")
               {
                  Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/user_story_write/user_story_locked_title"),LocText.current.text("dialog/user_story_write/user_story_locked_text"),LocText.current.text("general/button_ok")));
               }
               else
               {
                  Environment.reportError(param1.error,param1.request);
               }
               break;
            case "editUserStory":
               if(param1.error == "")
               {
                  Environment.application.updateData(param1.data);
                  if(Environment.panelManager.dialogManager.hasVisibleDialog(DialogUserStory))
                  {
                     (Environment.panelManager.dialogManager.getVisibleDialog(DialogUserStory) as DialogUserStory).refreshActiveUserStory();
                  }
                  close();
               }
               else if(param1.error == "errEditUserStoryLocked")
               {
                  Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/user_story_edit/user_story_locked_title"),LocText.current.text("dialog/user_story_edit/user_story_locked_text"),LocText.current.text("general/button_ok")));
               }
               else
               {
                  Environment.reportError(param1.error,param1.request);
               }
               break;
            default:
               throw new Error("Unsupported request action \'" + param1.action + "\'!");
         }
      }
      
      private function onClickClose(param1:InteractionEvent) : void
      {
         close();
      }
      
      override public function onEscape() : void
      {
         close();
      }
   }
}
