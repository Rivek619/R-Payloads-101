#!/usr/bin/env bash

#RUN chmod+x Remailvariants.sh
#Usage ./Remailvariants.sh <emailid@domain.com>
#Created by Rivek Raj Tamang - RivuDon

email="$1"
output_file="email_payloads.txt"

# Reset output file
> "$output_file"

local="${email%@*}"
domain="${email#*@}"

read -p "Generate ONLY non-domain (local-part) case variants? (y/n): " choice

# ---------- Local-part variants ----------
len=${#local}
for ((mask=0; mask < (1<<len); mask++)); do
  out=""
  for ((i=0; i<len; i++)); do
    c="${local:i:1}"
    if [[ "$c" =~ [A-Za-z] ]]; then
      if (( (mask >> i) & 1 )); then
        out+="${c^^}"
      else
        out+="${c,,}"
      fi
    else
      out+="$c"
    fi
  done
  line="${out}@${domain}"
  echo "$line" | tee -a "$output_file"
done

# ---------- Domain variants ----------
if [[ ! "$choice" =~ ^[Yy]$ ]]; then
  dlen=${#domain}
  for ((mask=0; mask < (1<<dlen); mask++)); do
    dout=""
    for ((i=0; i<dlen; i++)); do
      c="${domain:i:1}"
      if [[ "$c" =~ [A-Za-z] ]]; then
        if (( (mask >> i) & 1 )); then
          dout+="${c^^}"
        else
          dout+="${c,,}"
        fi
      else
        dout+="$c"
      fi
    done
    line="${local}@${dout}"
    echo "$line" | tee -a "$output_file"
  done
fi
