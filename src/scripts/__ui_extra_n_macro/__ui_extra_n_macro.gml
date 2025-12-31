
#region Syntax sugar (?)
#macro compute_begin (function() {
#macro compute_end   })()

#macro update_guard  if(!visible||!enabled)exit
#macro update_begin  update=function(_mx,_my){update_guard
#macro update_end    }

#macro draw_guard    if(!visible)exit
#macro draw_begin    draw=function(_px=0,_py=0){draw_guard
#macro draw_end      }
#endregion
