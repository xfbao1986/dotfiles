Vim�UnDo� ��vNe8�6�>���Y#�J��,�cB�Ķ���                                      Y�6B    _�                            ����                                                                                                                                                                                                                                                                                                                                                             Y�3&     �               'let test#runners = {'Ruby': ['GitHub']}5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             Y�3)     �               'let test#runners = {'ruby': ['GitHub']}5�_�                       !    ����                                                                                                                                                                                                                                                                                                                                                             Y�3+    �               'let test#runners = {'ruby': ['gitHub']}5�_�                          ����                                                                                                                                                                                                                                                                                                                                                  V        Y�4�     �                �             5�_�                            ����                                                                                                                                                                                                                                                                                                                                                  V        Y�4�     �                 5�_�                       +    ����                                                                                                                                                                                                                                                                                                                                                  V        Y�4�     �               2let g:test#runner_commands = ['Minitest', 'Mocha']5�_�      	                 1    ����                                                                                                                                                                                                                                                                                                                                                  V        Y�4�    �               2let g:test#runner_commands = ['Minitest', 'Rspec']5�_�      
           	          ����                                                                                                                                                                                                                                                                                                                                                             Y�4�     �               'let test#runners = {'ruby': ['github']}5�_�   	              
          ����                                                                                                                                                                                                                                                                                                                                                             Y�4�     �               'let test#runners = {'Ruby': ['github']}5�_�   
                    !    ����                                                                                                                                                                                                                                                                                                                                                             Y�4�     �               'let test#runners = {'Ruby': ['Github']}5�_�                       4    ����                                                                                                                                                                                                                                                                                                                                                             Y�4�    �               <let g:test#runner_commands = ['Minitest', 'Rspec', 'github']5�_�                       7    ����                                                                                                                                                                                                                                                                                                                                                             Y�4�   	 �               <let g:test#runner_commands = ['Minitest', 'Rspec', 'Github']5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             Y�5�     �              5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             Y�5�     �          	       5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             Y�5�     �       >   	       5�_�                    @        ����                                                                                                                                                                                                                                                                                                                                                             Y�5�     �   ?   @          <let g:test#runner_commands = ['Minitest', 'Rspec', 'GitHub']5�_�                    =        ����                                                                                                                                                                                                                                                                                                                                                             Y�5�     �   =   @   E       �   =   ?   D    5�_�                       #    ����                                                                                                                                                                                                                                                                                                                                                             Y�5�     �         F      +  return expand('%:p') =~# 'github/github/'5�_�                       #    ����                                                                                                                                                                                                                                                                                                                                                             Y�5�   
 �         F      $  return expand('%:p') =~# 'github/'5�_�                       &    ����                                                                                                                                                                                                                                                                                                                                                             Y�5�     �          G       �          F    5�_�                    @        ����                                                                                                                                                                                                                                                                                                                                                             Y�5�    �   ?   @           5�_�                            ����                                                                                                                                                                                                                                                                                                                                       ?           V        Y�6>    �             >   0function! test#ruby#github#test_file(file) abort   (  return expand('%:p') =~# 'github/test'   endfunction       ?function! test#ruby#github#build_position(type, position) abort     if a:type == 'nearest'   .    let test_name = s:nearest_test(a:position)   H    let matching_lines = s:matching_lines(test_name, a:position['file'])   T    let line_number = s:find_nearest_line_number(a:position['line'], matching_lines)       B    return [a:position['file'], '--name', "'/L".line_number."$/'"]     elseif a:type == 'file'       return [a:position['file']]     else       return []     endif   endfunction       1function! test#ruby#github#build_args(args) abort   #  return [get(l:, 'path')] + a:args   endfunction       -function! test#ruby#github#executable() abort     return 'script/testrb_or_zt'   endfunction       (function! s:nearest_test(position) abort   E  let name = test#base#nearest_test(a:position, g:test#ruby#patterns)         if empty(name['test'])       let test = ''     else       let test = name['test'][0]     endif         return escape(test, '"')   endfunction       <function! s:find_nearest_line_number(needle, haystack) abort     let closest_line_number = ''     let closest_distance = ''         for line_number in a:haystack   .    let distance = abs(line_number - a:needle)        if closest_line_number == ''   +      let closest_line_number = line_number   %      let closest_distance = distance   &    elseif distance < closest_distance   +      let closest_line_number = line_number   %      let closest_distance = distance   	    endif     endfor         return closest_line_number   endfunction       1function! s:matching_lines(test_name, file) abort   M  let command = 'egrep -n "x?test.*'.a:test_name.'" '.a:file.' | cut -f1 -d:'   $  let results = system(command)[:-2]     return split(results, "\n")   endfunction    5�_�                             ����                                                                                                                                                                                                                                                                                                                                                  V        Y�6A    �                 &" Custom test runner for github/github5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             Y�5�     �          	      0function! test#ruby#github#test_file(file) abort   endfunction�         
        �               -    return expand('%:p') =~# 'github/github/'     endfunction       A  function! test#ruby#github#build_position(type, position) abort     endfunction�                   �                     if a:type == 'nearest'         endif�                       �               6            let test_name = s:nearest_test(a:position)   T                let matching_lines = s:matching_lines(test_name, a:position['file'])   d                    let line_number = s:find_nearest_line_number(a:position['line'], matching_lines)       V                        return [a:position['file'], '--name', "'/L".line_number."$/'"]   1                          elseif a:type == 'file'   ;                                return [a:position['file']]   &                                  else   1                                        return []   /                                          endif   3                                        endfunction       Y                                        function! test#ruby#github#build_args(args) abort   3                                        endfunction�               *                                          �                M                                            return [get(l:, 'path')] + a:args   5                                          endfunction       W                                          function! test#ruby#github#executable() abort   5                                          endfunction�         $      ,                                            �         %      J                                              return 'script/testrb_or_zt'   7                                            endfunction       T                                            function! s:nearest_test(position) abort   7                                            endfunction�         )      .                                              �         *      s                                                let name = test#base#nearest_test(a:position, g:test#ruby#patterns)       H                                                  if empty(name['test'])   7                                                  endif�         -      4                                                    �          .   
   E                                                        let test = ''   >                                                          else   Z                                                                let test = name['test'][0]   G                                                                  endif       \                                                                    return escape(test, '"')   M                                                                  endfunction       ~                                                                  function! s:find_nearest_line_number(needle, haystack) abort   M                                                                  endfunction�   '   (   7      D                                                                    �   '   )   8      b                                                                      let closest_line_number = ''   a                                                                        let closest_distance = ''       g                                                                          for line_number in a:haystack   P                                                                          endfor�   +   ,   <      L                                                                            �   +   -   =      z                                                                                let distance = abs(line_number - a:needle)   p                                                                                    if closest_line_number == ''   Y                                                                                    endif�   -   .   ?      V                                                                                      �   -   /   @      �                                                                                            let closest_line_number = line_number   �                                                                                                  let closest_distance = distance   �                                                                                                      elseif distance < closest_distance   �                                                                                                              let closest_line_number = line_number   �                                                                                                                    let closest_distance = distance   }                                                                                                                        endif   �                                                                                                                          endfor       �                                                                                                                            return closest_line_number   �                                                                                                                          endfunction       �                                                                                                                          function! s:matching_lines(test_name, file) abort   �                                                                                                                          endfunction�   9   :   L      |                                                                                                                            �   9   ;   M      �                                                                                                                              let command = 'egrep -n "x?test.*'.a:test_name.'" '.a:file.' | cut -f1 -d:'   �                                                                                                                                let results = system(command)[:-2]   �                                                                                                                                  return split(results, "\n")   �                                                                                                                                endfunction5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             Y�5�     �          	      0function! test#ruby#github#test_file(file) abort   endfunction�         
        �               -    return expand('%:p') =~# 'github/github/'     endfunction       A  function! test#ruby#github#build_position(type, position) abort     endfunction�                   �                     if a:type == 'nearest'         endif�                       �               6            let test_name = s:nearest_test(a:position)   T                let matching_lines = s:matching_lines(test_name, a:position['file'])   d                    let line_number = s:find_nearest_line_number(a:position['line'], matching_lines)       V                        return [a:position['file'], '--name', "'/L".line_number."$/'"]   1                          elseif a:type == 'file'   ;                                return [a:position['file']]   &                                  else   1                                        return []   /                                          endif   3                                        endfunction       Y                                        function! test#ruby#github#build_args(args) abort   3                                        endfunction�               *                                          �                M                                            return [get(l:, 'path')] + a:args   5                                          endfunction       W                                          function! test#ruby#github#executable() abort   5                                          endfunction�         $      ,                                            �         %      J                                              return 'script/testrb_or_zt'   7                                            endfunction       T                                            function! s:nearest_test(position) abort   7                                            endfunction�         )      .                                              �         *      s                                                let name = test#base#nearest_test(a:position, g:test#ruby#patterns)       H                                                  if empty(name['test'])   7                                                  endif�         -      4                                                    �          .   
   E                                                        let test = ''   >                                                          else   Z                                                                let test = name['test'][0]   G                                                                  endif       \                                                                    return escape(test, '"')   M                                                                  endfunction       ~                                                                  function! s:find_nearest_line_number(needle, haystack) abort   M                                                                  endfunction�   '   (   7      D                                                                    �   '   )   8      b                                                                      let closest_line_number = ''   a                                                                        let closest_distance = ''       g                                                                          for line_number in a:haystack   P                                                                          endfor�   +   ,   <      L                                                                            �   +   -   =      z                                                                                let distance = abs(line_number - a:needle)   p                                                                                    if closest_line_number == ''   Y                                                                                    endif�   -   .   ?      V                                                                                      �   -   /   @      �                                                                                            let closest_line_number = line_number   �                                                                                                  let closest_distance = distance   �                                                                                                      elseif distance < closest_distance   �                                                                                                              let closest_line_number = line_number   �                                                                                                                    let closest_distance = distance   }                                                                                                                        endif   �                                                                                                                          endfor       �                                                                                                                            return closest_line_number   �                                                                                                                          endfunction       �                                                                                                                          function! s:matching_lines(test_name, file) abort   �                                                                                                                          endfunction�   9   :   L      |                                                                                                                            �   9   ;   M      �                                                                                                                              let command = 'egrep -n "x?test.*'.a:test_name.'" '.a:file.' | cut -f1 -d:'   �                                                                                                                                let results = system(command)[:-2]   �                                                                                                                                  return split(results, "\n")   �                                                                                                                                endfunction5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             Y�5�     �         	       �         
      )n! test#ruby#github#test_file(file) abort   +  return expand('%:p') =~# 'github/github/'   endfunction       ?function! test#ruby#github#build_position(type, position) abort   endfunction�                 �                   if a:type == 'nearest'   	    endif�                     �      	         4          let test_name = s:nearest_test(a:position)   R              let matching_lines = s:matching_lines(test_name, a:position['file'])   b                  let line_number = s:find_nearest_line_number(a:position['line'], matching_lines)       T                      return [a:position['file'], '--name', "'/L".line_number."$/'"]   /                        elseif a:type == 'file'   9                              return [a:position['file']]   $                                else   /                                      return []   -                                        endif   1                                      endfunction       W                                      function! test#ruby#github#build_args(args) abort   1                                      endfunction�               (                                        �                K                                          return [get(l:, 'path')] + a:args   3                                        endfunction       U                                        function! test#ruby#github#executable() abort   3                                        endfunction�         $      *                                          �         %      H                                            return 'script/testrb_or_zt'   5                                          endfunction       R                                          function! s:nearest_test(position) abort   5                                          endfunction�         )      ,                                            �         *      q                                              let name = test#base#nearest_test(a:position, g:test#ruby#patterns)       F                                                if empty(name['test'])   5                                                endif�          -      2                                                  �      !   .   
   C                                                      let test = ''   <                                                        else   X                                                              let test = name['test'][0]   E                                                                endif       Z                                                                  return escape(test, '"')   K                                                                endfunction       |                                                                function! s:find_nearest_line_number(needle, haystack) abort   K                                                                endfunction�   (   )   7      B                                                                  �   (   *   8      `                                                                    let closest_line_number = ''   _                                                                      let closest_distance = ''       e                                                                        for line_number in a:haystack   N                                                                        endfor�   ,   -   <      J                                                                          �   ,   .   =      x                                                                              let distance = abs(line_number - a:needle)   n                                                                                  if closest_line_number == ''   W                                                                                  endif�   .   /   ?      T                                                                                    �   .   0   @                                                                                                let closest_line_number = line_number                                                                                                   let closest_distance = distance   �                                                                                                    elseif distance < closest_distance   �                                                                                                            let closest_line_number = line_number   �                                                                                                                  let closest_distance = distance   {                                                                                                                      endif   ~                                                                                                                        endfor       �                                                                                                                          return closest_line_number   �                                                                                                                        endfunction       �                                                                                                                        function! s:matching_lines(test_name, file) abort   �                                                                                                                        endfunction�   :   ;   L      z                                                                                                                          �   :   <   M      �                                                                                                                            let command = 'egrep -n "x?test.*'.a:test_name.'" '.a:file.' | cut -f1 -d:'   �                                                                                                                              let results = system(command)[:-2]   �                                                                                                                                return split(results, "\n")   �                                                                                                                              endfunction5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             Y�4K    �               /let test#runner_commands = {'ruby': ['github']}5��